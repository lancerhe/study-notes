每小时定时备份

    0 */1 * * * /usr/local/mysql/bin/mysqldump -uroot -p****** heart > /data/backup/heart_$(date +%m%d_%H%M).sql
