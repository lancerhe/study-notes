# 增加静态路由
```
route print
route add 192.168.1.160 mask 255.255.255.255 10.0.1.8
```

# 查看php进程消耗了多少内存
```
pmap $(pgrep php-fpm | head -1)

# php进程实际消耗
ps -ylC php-fpm --sort:rss

# php进程平均消耗内存
ps --no-headers -o "rss,cmd" -C php-fpm | awk '{sum+=$1} END {printf ("%d%s\n", sum/NR/1024, "M")}'
```

# 文件头部增加一行
```
sed -i '1i\use sdk;' /tmp/client_device.sql.20151021
```

# 去除文件中的^M字符
```
sed -i 's/\r//g' /home/html/test.php
```
# 获取当前执行文件所在目录
```
$(cd `dirname $0`; pwd)
```
# 句柄设置，完成后Reboot
```
cat >> /etc/security/limits.conf <<-EOF
* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535
EOF
```
# 设置文件保护权限
```
chattr +i /etc/passwd
lsattr /etc/passwd

—-i——–e- /etc/passwd

chattr -i /etc/shadow
```
