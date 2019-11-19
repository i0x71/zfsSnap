# zfsSnap
#### Simple zfs cleanup snapshot script with no dependencies
#### Script is used for snapshot cleanup, see examples.

root@host:~# /tank/scripts/zfsSnap.sh 
/tank/scripts/zfsSnap.sh **[time_period] [olderThan]**

**olderThan amount in seconds.**

## Examples:
root@host:~# zfs snapshot tank/media@**media_daily**_`date +%s`

root@host:~# /tank/scripts/zfsSnap.sh **media_daily 86400**

*86000 seconds is 24 hours*

root@host:~# zfs snapshot swamptank/syncthing@**media_weekly**_`date +%s`

root@host:~# /tank/scripts/zfsSnap.sh **media_weekly 604800**

*604800 seconds is 7 days*


## Cron examples:
@daily /usr/local/sbin/zfs snapshot tank/media@**media_daily**_`date +%s`
@daily /tank/scripts/zfsSnap.sh **media_daily 86400**

@weekly /usr/local/sbin/zfs snapshot tank/Mmedia@**media_weekly**_`date +%s`
@weekly /tank/scripts/zfsSnap.sh **media_weekly 604800**
