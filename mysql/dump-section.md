
# 导出指定区域的表，用于备份
```
/usr/bin/mysqldump -h192.168.1.10 -usdk -p123456 --single-transaction --where="ctime < 1443628800" sdk appused | sed -e 's/`appused`/`appused_201509`/' > /tmp/appused_201509.sql
sed -i '1i\USE `sdk-cross-section`;' /tmp/appused_201509.sql
/usr/bin/mysql -h192.168.1.10 -usdk -p123456 -e "source /tmp/appused_201509.sql"
DELETE FROM `appused` WHERE `ctime` < '1443628800'
OPTIMIZE TABLE `appused`
```
