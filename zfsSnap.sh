#!/bin/bash
if [ $# -ne 2 ]
  then
    echo "$0 [time_period] [olderThan]"
    exit
fi

dateNow=`date +%s`
snapshotTimePeriod=$1
olderThan=$2

while read -r snapshot
do
  snapshotDate=`echo $snapshot | awk -F '@' '{ print $2 }' | awk -F '_' '{ print $2 }'`
  let snapshotAge=dateNow-snapshotDate
  echo "[+] $snapshot|$snapshotAge"
  if (( $snapshotAge > $olderThan ))
  then
    eval "echo $snapshot | grep $snapshotTimePeriod > /dev/null"
    status=$?
    if test $status -eq 0
    then
      echo "[+] Destroying $snapshot"
      /usr/local/sbin/zfs destroy $snapshot
    fi
  fi
done < <(zfs list -t snapshot -H | awk '{ print $1 }' | grep $snapshotTimePeriod)
