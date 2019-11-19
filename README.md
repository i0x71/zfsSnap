# zfsSnap
## ZFS Snapshot automatic create/destroy script ##

root@swamp:/swamptank/scripts# ./zfsSnap.sh 

./zfsSnap.sh [create|destroy] [snapshotName] [olderThan]


## Examples ##
root@host:~# ./zfsSnap.sh create tank/media@minute

root@host:~# ./zfsSnap.sh destroy tank/media@minute 60

## Crontab examples ##
**Hourly**
> 0 * * * * /tank/scripts/zfsSnap.sh create tank/media@hourly

> 0 * * * * /tank/scripts/zfsSnap.sh destroy tank/media@hourly 3600

**Daily**

> @daily /tank/scripts/zfsSnap.sh create tank/media@daily

> @daily /tank/scripts/zfsSnap.sh destroy tank/media@daily 86400

**Weekly**

> @weekly /tank/scripts/zfsSnap.sh create tank/media@weekly

> @weekly /tank/scripts/zfsSnap.sh destroy tank/media@weekly 604800

**Monthly**

> @monthly /tank/scripts/zfsSnap.sh create tank/media@autoMonthly

** Keep monthly for 15552000 (6 months) **

> @monthly /tank/scripts/zfsSnap.sh destroy tank/media@autoMonthly 15552000     


**3600 seconds is 1 hour | 86400 seconds is 24 hours | 604800 seconds is 7 days**

