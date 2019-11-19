#!/bin/bash
# Check if atleast 2 arguments have been passed
zfsPath='/usr/local/sbin/zfs'

if [ "$#" -lt 2 ]
  then
    echo "$0 [create|destroy] [snapshotName] [olderThan]"
    exit
fi

dateNow=`date +%s`
# Sort the command
if [[ "$1" == "create" ]]
then
  # CREATE
  $zfsPath snapshot $2_$dateNow
elif [[ "$1" == "destroy" ]]
then
  # DESTROY
  if [[ "$3" == "" ]]
  then
    echo "$0 [create|destroy] [snapshotName] [olderThan]"
    exit
  fi

  snapshotName=$2
  olderThan=$3

  while read -r snapshot
  do
    snapshotDate=`echo $snapshot | awk -F '@' '{ print $2 }' | awk -F '_' '{ print $NF }'`
    let snapshotAge=dateNow-snapshotDate
    echo "[+] $snapshot|$snapshotAge"
    if (( $snapshotAge > $olderThan ))
    then
      eval "echo $snapshot | grep $snapshotName > /dev/null"
      status=$?
      if test $status -eq 0
      then
        echo "[+] Destroying $snapshot"
        $zfsPath destroy $snapshot
      fi
    fi
  done < <($zfsPath list -t snapshot -H | awk '{ print $1 }' | grep $snapshotName)
else
    echo "$0 [create|destroy] [snapshotName] [olderThan]"
fi
