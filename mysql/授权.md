## 远程IP地址连接mysql连接授权
```sql
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.8.1' IDENTIFIED BY 'root' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
```