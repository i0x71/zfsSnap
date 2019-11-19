# zfsSnap
## ZFS Snapshot automatic create/destroy script ##

root@swamp:/swamptank/scripts# ./zfsSnap.sh 

./zfsSnap.sh [create|destroy] [snapshotName] [olderThan]


## Examples ##
root@host:~# ./zfsSnap.sh create swamptank/syncthing@minute

root@host:~# ./zfsSnap.sh destroy swamptank/syncthing@minute 60

## Crontab examples ##
@daily /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@minute

@daily /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@minute 60

@daily /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@minute

@daily /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@minute 60

@weekly /swamptank/scripts/zfsSnap.sh create swamptank/syncthing@minute

@weekly /swamptank/scripts/zfsSnap.sh destroy swamptank/syncthing@minute 60

