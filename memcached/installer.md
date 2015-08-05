## 依赖包安装
```shell
yum install libevent-devel
```

## 安装
```shell
wget http://memcached.googlecode.com/files/memcached-1.4.15.tar.gz
tar zxvf memcached-1.4.15.tar.gz
cd memcached-1.4.15
./configure --with-libevent=/usr/lib --prefix=/usr/local/memcached-1.4.15
make && make install

ln -s /usr/local/memcached-1.4.15/ /usr/local/memcached
ln -s /usr/local/memcached/bin/memcached  /usr/local/bin/memcached
```

## 启动服务
```shell
memcached -d -m 10 -u root -l 192.168.1.112 -p 11211 -c 256 -P /tmp/memcached.pid
```

    -d选项是启动一个守护进程，
    -m是分配给Memcache使用的内存数量，单位是MB，我这里是10MB，
    -u是运行Memcache的用户，我这里是root，
    -l是监听的服务器IP地址，如果有多个地址的话，我这里指定了服务器的IP地址192.168.0.200，
    -p是设置Memcache监听的端口，我这里设置了11211，最好是1024以上的端口，
    -c选项是最大运行的并发连接数，默认是1024，我这里设置了256，按照你服务器的负载量来设定，
    -P是设置保存Memcache的pid文件，我这里是保存在 /tmp/memcached.pid

## 停止Memcache
```shell
kill `cat /tmp/memcached.pid`
# 或者查找进程号后Kill
ps -ef | grep memcached
    root     31543     1  1 03:14 ?        00:00:00 memcached -d -m 10 -u root -l 192.168.1.112 -p 11211 -c 256 -P /tmp/memcached.pid
    root     31550  1750 14 03:14 pts/1    00:00:00 grep memcached
kill 31543
```

## PHP扩展
[http://pecl.php.net/package/memcache](http://pecl.php.net/package/memcache)
```shell
wget http://pecl.php.net/get/memcache-3.0.8.tgz
tar -zxf  memcache-3.0.8.tgz
cd memcache-3.0.8
/usr/local/php-5.3.27/bin/phpize
./configure --with-php-config=/usr/local/php-5.3.27/bin/php-config --with-zlib-dir
make && make install
echo "extension = memcache.so" >> /usr/local/php-5.3.27/etc/php.ini
```

## 启动服务脚本
```shell
vim /etc/init.d/memcached
```


##### 启动文件内容
```shell
#!/bin/sh
#
# memcached:    MemCached Daemon
#
# chkconfig:    - 90 25
# description:  MemCached Daemon
#
# Source function library.
. /etc/rc.d/init.d/functions
. /etc/sysconfig/network

start() {
    echo -n $"Starting memcached: "
    daemon /usr/local/bin/memcached -d -m 200 -u root -l 192.168.1.111 -p 11211 -c 256 -P /tmp/memcached.pid
    echo
}

stop() {
    echo -n $"Shutting down memcached: "
    killproc memcached
    echo
}

[ -f /usr/local/bin/memcached ] || exit 0

# See how we were called.   
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart|reload)
        stop
        start
        ;;
    condrestart)
        stop
        start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|reload|condrestart}"  
        exit 1
esac
exit 0
```

##### 开机启动
```shell
chmod +x  /etc/init.d/memcached
chkconfig memcached on
```
