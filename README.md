### cronjob 範例
```
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user	command
*/1 * * * *   root echo "Crontab is working. Cronjob 背景運作中." > /proc/1/fd/1 2>&1
#
```
### 注意事項
- 若cronjob 失敗, 確認data/cron.d資料夾內檔案owner 是否為 root
  - 執行`sudo chown -R root data` 將owner 設定為root
