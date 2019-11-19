# zfsSnap
## ZFS Snapshot automatic create/destroy script ##

root@swamp:/swamptank/scripts# ./zfsSnap.sh 

./zfsSnap.sh [create|destroy] [snapshotName] [olderThan]


## Examples ##
root@host:~# ./zfsSnap.sh create swamptank/syncthing@minute

root@host:~# ./zfsSnap.sh destroy swamptank/syncthing@minute 60

## Crontab examples ##
0 * * * * /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@hourly

0 * * * * /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@hourly 3600

@daily /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@daily

@daily /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@daily 86400

@weekly /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@minute

@weekly /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@minute 604800


**3600 seconds is 1 hour | 86400 seconds is 24 hours | 604800 seconds is 7 days**

