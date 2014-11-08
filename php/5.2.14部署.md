## 依赖包安装
```shell
yum -y install gcc gcc+ gcc-c++ gcc-g77 flex bison autoconf \
automake bzip2-devel zlib-devel ncurses-devel libjpeg-devel \
libpng-devel libtiff-devel freetype-devel pam-devel openssl-devel \
mod_ssl libxml2-devel gettext-devel pcre-devel curl-devel \
mysql-devel libevent-devel  libmcrypt  libmcrypt-devel \
libtool-ltdl libtool-ltdl-devel 
```

## 下载源代码包
```shell
cd /usr/local/src
wget http://museum.php.net/php5/php-5.2.14.tar.gz
wget http://php-fpm.org/downloads/php-5.2.14-fpm-0.5.14.diff.gz
wget http://blog.s135.com/soft/linux/nginx_php/eaccelerator/eaccelerator-0.9.6.1.tar.bz2
wget http://downloads.zend.com/optimizer/3.3.3/ZendOptimizer-3.3.3-linux-glibc23-x86_64.tar.gz
```

## php-fpmb安装
```shell
tar -zxf php-5.2.14.tar.gz
/bin/gzip -cd php-5.2.14-fpm-0.5.14.diff.gz | patch -d php-5.2.14 -p1
cd php-5.2.14
uname -m
```

> 若uname结果为：x86_64, 则使用下面命令生成编译配置
```shell
CHOST="i686-pc-linux-gnu" CFLAGS="-O3 -msse2 -mmmx -Wall -W -mfpmath=sse -pipe -fomit-frame-pointer"
CXXFLAGS="-O3 -msse2 -mmmx -Wall -W -mfpmath=sse -funroll-loops -pipe -fomit-frame-pointer"
./configure \
    --prefix=/usr/local/php-5.2.14 \
    --enable-fastcgi \
    --enable-discard-path \
    --enable-force-cgi-redirect \
    --with-libdir=lib64 \
    --with-pear=/usr/share/php \
    --with-zlib-dir \
    --with-bz2 \
    --with-libxml-dir=/usr \
    --with-gd --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-ttf=shared \
    --enable-mbstring \
    --with-mysql \
    --with-mysqli \
    --with-pdo_mysql \
    --with-config-file-path=/usr/local/php-5.2.14/etc \
    --with-iconv \
    --disable-ipv6 \
    --enable-static \
    --enable-zend-multibyte \
    --enable-inline-optimization \
    --enable-zend-multibyte \
    --enable-sockets \
    --enable-soap \
    --with-openssl \
    --with-gettext \
    --with-curl \
    --enable-ftp \
    --enable-fpm \
    --enable-shmop
```

> 若uname结果为：i686或i586, 则使用下面命令安装
```shell
CHOST="i686-pc-linux-gnu"
CFLAGS="-O3 -msse2 -mmmx -Wall -W -mfpmath=sse -pipe -fomit-frame-pointer"
CXXFLAGS="-O3 -msse2 -mmmx -Wall -W -mfpmath=sse -funroll-loops -pipe -fomit-frame-pointer"
./configure \
    --prefix=/usr/local/php-5.2.14 \
    --enable-fastcgi \
    --enable-discard-path \
    --enable-force-cgi-redirect \
    --with-pear=/usr/share/php \
    --with-zlib-dir \
    --with-bz2 \
    --with-libxml-dir=/usr \
    --with-gd \
    --enable-gd-native-ttf  \
    --enable-gd-jis-conv  \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-ttf=shared \
    --enable-mbstring \
    --with-mysql \
    --with-mysqli \
    --with-pdo_mysql \
    --with-config-file-path=/usr/local/php-5.2.14/etc \
    --with-iconv \
    --disable-ipv6 \
    --enable-static \
    --enable-zend-multibyte \
    --enable-inline-optimization \
    --enable-zend-multibyte \
    --enable-sockets \
    --enable-soap \
    --with-openssl \
    --with-gettext \
    --with-curl \
    --enable-ftp \
    --enable-fpm \
    --enable-shmop \
    --with-mcrypt
```
##### 编译安装
```shell 
make && make install
/bin/cp -f php.ini-recommended /usr/local/php-5.2.14/etc/php.ini
ln -s /usr/local/php-5.2.14 /usr/local/php
```

## 安装eaccelerator
```shell
cd /usr/local/src
tar -jxf eaccelerator-0.9.6.1.tar.bz2
cd eaccelerator-0.9.6.1
/usr/local/php-5.2.14/bin/phpize
./configure \
    --enable-eaccelerator=shared \
    --with-php-config=/usr/local/php-5.2.14/bin/php-config
make && make install
mkdir  /tmp/eaccelerator
chmod -R 777 /tmp/eaccelerator
```

## 安装Zend扩展
```shell
cd /usr/local/src
wget http://downloads.zend.com/optimizer/3.3.3/ZendOptimizer-3.3.3-linux-glibc23-x86_64.tar.gz
tar -zxf ZendOptimizer-3.3.3-linux-glibc23-x86_64.tar.gz
cd ZendOptimizer-3.3.3-linux-glibc23-x86_64
./install.sh
```
![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-1.png)

![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-2.png)

![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-3.png)

##### 选择安装目录
![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-4.png)

##### 指定 php 配置文件的路径
![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-5.png)

##### 这里是nginx的web，apache选择no
![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-6.png)

![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-7.png)

下面是说明`Zend Optimizer`对`php`配置文件操作的解释（不需要我们去操作），

首先是备份`php.ini`

zend使用了现有的`php.ini`,剪切到自己的目录`/usr/local/Zend/etc`下，
```shell
ln -s /usr/local/Zend/etc/php.ini /usr/local/php/etc/php.ini
```
![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-8.png)

![image](https://github.com/LancerHe/study-notes/blob/master/php/screenshots/5.2.14-9.png)

## 安装其他的扩展模块`zip`,`ftp`,`mbstring`
```shell
cd /usr/local/src/php-5.2.14/ext/zip
/usr/local/php-5.2.14/bin/phpize
./configure --with-php-config=/usr/local/php-5.2.14/bin/php-config
make && make install
echo 'extension = zip.so' >> /usr/local/php-5.2.14/etc/php.ini
```

## 增加Zend和eaccelerator在php.ini中的信息
```shell
vim /usr/local/php-5.2.14/etc/php.ini
    date.timezone=Asia/Shanghai

    [eaccelerator]
    extension_dir=/usr/local/php/lib/php/extensions/no-debug-non-zts-20060613/
    extension=eaccelerator.so
    eaccelerator.shm_size="256"
    eaccelerator.cache_dir="/tmp/eaccelerator"
    eaccelerator.enable="1"
    eaccelerator.optimizer="1"
    eaccelerator.check_mtime="1"
    eaccelerator.debug="0"
    eaccelerator.filter=""
    eaccelerator.shm_max="0"
    eaccelerator.shm_ttl="0"
    eaccelerator.shm_prune_period="0"
    eaccelerator.shm_only="0"
    eaccelerator.compress="1"
    eaccelerator.compress_level="9"

    [Zend]
    zend_optimizer.optimization_level=1023
    ;zend_extension=/usr/local/Zend/lib/ZendExtensionManager.so
```

## 设置php-fpm
```shell
mv /usr/local/php-5.2.14/etc/php-fpm.conf /usr/local/php-5.2.14/etc/php-fpm_default.conf
vi /usr/local/php-5.2.14/etc/php-fpm.conf
    <?xml version="1.0" ?>
    <configuration>
        <value name="pid_file">/usr/local/php/logs/php-fpm.pid</value>
        <value name="error_log">/usr/local/php/logs/php-fpm.log</value>
        <value name="listen_address">127.0.0.1:9000</value>
        <value name="user">nobody</value>
        <value name="max_children">128</value>
        <value name="apache_like"></value>
        <value name="StartServers">40</value>
        <value name="MinSpareServers">50</value>
        <value name="MaxSpareServers">250</value>
        <value name="request_slowlog_timeout">2s</value>
        <value name="rlimit_files">65535</value>
        <value name="max_requests">10240</value>
    </configuration>
```

## 启动服务脚本
```shell
vim /etc/init.d/php-fpm
```

##### 启动文件内容
```shell
#! /bin/sh

### BEGIN INIT INFO
# Provides:                   php-fpm
# Required-Start:       $all
# Required-Stop:         $all
# Default-Start:         2 3 4 5
# Default-Stop:           0 1 6
# Short-Description: starts php-fpm
# Description:             starts the PHP FastCGI Process Manager daemon
### END INIT INFO

php_fpm_BIN=/usr/local/php/sbin/php-fpm
php_fpm_CONF=/usr/local/php/etc/php-fpm.conf
php_fpm_PID=/usr/local/php/logs/php-fpm.pid

php_opts="--fpm-config $php_fpm_CONF"

wait_for_pid () {
    try=0 

    while test $try -lt 35 ; do 

        case "$1" in 
            'created') 
            if [ -f "$2" ] ; then 
                try='' 
                break 
            fi 
            ;; 

            'removed') 
            if [ ! -f "$2" ] ; then 
                try='' 
                break 
            fi 
            ;; 
        esac 

        echo -n . 
        try=`expr $try + 1` 
        sleep 1 
    done 
}

case "$1" in
    start) 
        echo -n "Starting php-fpm " 

        $php_fpm_BIN start 

        if [ "$?" != 0 ] ; then 
            echo " failed" 
            exit 1 
        fi 

        wait_for_pid created $php_fpm_PID 

        if [ -n "$try" ] ; then 
            echo " failed" 
            exit 1 
        else 
            echo " done" 
        fi 
    ;; 

    stop) 
        echo -n "Gracefully shutting down php-fpm " 

        if [ ! -r $php_fpm_PID ] ; then 
            echo "warning, no pid file found - php-fpm is not running ?" 
            exit 1 
        fi 

        kill -QUIT `cat $php_fpm_PID` 

        wait_for_pid removed $php_fpm_PID 

        if [ -n "$try" ] ; then 
            echo " failed. Use force-exit" 
            exit 1 
        else 
            echo " done" 
        fi 
    ;; 

    force-quit) 
        echo -n "Terminating php-fpm " 

        if [ ! -r $php_fpm_PID ] ; then 
            echo "warning, no pid file found - php-fpm is not running ?" 
            exit 1 
        fi 

        kill -TERM `cat $php_fpm_PID` 

        wait_for_pid removed $php_fpm_PID 

        if [ -n "$try" ] ; then 
            echo " failed" 
            exit 1 
        else 
            echo " done" 
        fi 
    ;; 

    restart) 
        $0 stop 
        $0 start 
    ;; 

    reload) 

        echo -n "Reload service php-fpm " 

        if [ ! -r $php_fpm_PID ] ; then 
            echo "warning, no pid file found - php-fpm is not running ?" 
            exit 1 
        fi 

        kill -USR2 `cat $php_fpm_PID` 

        echo " done" 
        ;; 

    *) 
        echo "Usage: $0 {start|stop|force-quit|restart|reload}" 
        exit 1 
        ;;
esac
```

##### 开机启动
```shell
chmod +x  /etc/init.d/php-fpm
chkconfig php-fpm on
```