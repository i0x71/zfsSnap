# zfsSnap
## ZFS Snapshot automatic create/destroy script ##

root@swamp:/swamptank/scripts# ./zfsSnap.sh 

./zfsSnap.sh [create|destroy] [snapshotName] [olderThan]


## Examples ##
root@host:~# ./zfsSnap.sh create tank/media@minute

root@host:~# ./zfsSnap.sh destroy tank/media@minute 60

## Crontab examples ##
0 * * * * /tank/scripts/zfsSnap.sh create tank/media@hourly

0 * * * * /tank/scripts/zfsSnap.sh destroy tank/media@hourly 3600

@daily /tank/scripts/zfsSnap.sh create tank/media@daily

@daily /tank/scripts/zfsSnap.sh destroy tank/media@daily 86400

@weekly /tank/scripts/zfsSnap.sh create tank/media@minute

@weekly /tank/scripts/zfsSnap.sh destroy tank/media@minute 604800


**3600 seconds is 1 hour | 86400 seconds is 24 hours | 604800 seconds is 7 days**

