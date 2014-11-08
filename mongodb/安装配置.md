## 下载源
[http://www.mongodb.org/downloads](http://www.mongodb.org/downloads)
[http://docs.mongodb.org/manual/tutorial/install-mongodb-on-linux/](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-linux/)

## 安装
```shell
wget -c http://fastdl.mongodb.org/linux/mongodb-linux-i686-2.4.1.tgz
tar -zxvf mongodb-linux-i686-2.4.1.tgz
cp -R mongodb-linux-i686-2.4.1 /usr/local/mongodb-2.4.1
ln -s /usr/local/mongodb-2.4.1/ /usr/local/mongodb
ln -s /usr/local/mongodb/bin/mongod /usr/local/bin/mongod
mkdir /data/mongodb
```

## 启动服务
```shell
mongod --dbpath=/data/mongodb/ --logpath=/var/log/mongodb.log --fork
```

## 停止服务
```shell
/usr/local/mongodb/bin/mongo admin --eval "db.shutdownServer()"
```

## PHP扩展
[http://pecl.php.net/package/mongo](http://pecl.php.net/package/mongo)
```shell
http://pecl.php.net/get/mongo-1.3.6.tgz
/usr/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
echo "extension = mongo.so" >> /usr/local/php-5.3.27/etc/php.ini
```

## 启动服务脚本
```shell
vim /etc/init.d/mongod
```

##### 启动文件内容
```shell
#!/bin/bash
#
# mongodb     Startup script for the mongodb server
#
# chkconfig: - 64 36
# description: MongoDB Database Server
#
# processname: mongodb

# Source function library
. /etc/rc.d/init.d/functions
 
if [ -f /etc/sysconfig/mongodb ]; then
    . /etc/sysconfig/mongodb
fi
 
prog="mongod"
mongod="/usr/local/mongodb/bin/mongod"
RETVAL=0
 
start() {
    echo -n $"Starting $prog: "
    daemon $mongod "--dbpath=/data/mongodb/ --port=27017 --fork --logpath /var/log/mongodb.log --logappend 2>&1 >>/var/log/mongodb.log"
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/$prog
    return $RETVAL
}
 
stop() {
    echo -n $"Stopping $prog: "
    killproc $prog
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/$prog
    return $RETVAL
}
 
reload() {
    echo -n $"Reloading $prog: "
    killproc $prog -HUP
    RETVAL=$?
    echo
    return $RETVAL
}
 
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    condrestart)
        if [ -f /var/lock/subsys/$prog ]; then
            stop
            start
        fi
        ;;
    reload)
        reload
        ;;
    status)
        status $mongod
        RETVAL=$?
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|condrestart|reload|status}"
        RETVAL=1
esac
 
exit $RETVAL
```

##### 开机启动
```shell
chmod +x /etc/init.d/mongod
chkconfig mongod on
```