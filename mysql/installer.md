## 安装依赖库
```shell
yum -y install make gcc ncurses-devel gcc-c++ libtool libtool-ltdl libtool-ltdl-devel cmake
```

## 下载源
```shell
wget http://downloads.mysql.com/archives/mysql-5.1/mysql-5.1.70.tar.gz
```

## 编译安装
```shell
# 如果是重新安装，需要先清理干净
make clean
make distclean

# 创建用户和组
groupadd mysql
useradd -g mysql mysql

# 创建数据库文件存放的位置
mkdir -p /data/mysql
chown -R mysql:mysql /data/mysql

# 解压编译
tar -zxvf mysql-5.1.70.tar.gz
cd mysql-5.1.70
    ./configure \
    --prefix=/usr/local/mysql-5.1.70 \
    --with-charset=utf8 \
    --with-collation=utf8_general_ci \
    --with-extra-charsets=complex \
    --with-mysqld-user=mysql \
    --localstatedir=/data/mysql \
    --sysconfdir=/data/mysql \
    --without-docs \
    --without-man \
    --without-test \
    --enable-thread-safe-client \
    --enable-assembler \
    --with-big-tables\
    --with-plugins=partition,heap,myisam,myisammrg,csv,innobase,innodb_plugin
```

> 若在编译MySQL的过程中发现错误提示：
> /bin/rm: cannot remove `libtoolt`: No such file or directory: 
> vim configure
> 注释这行：
> $RM "$cfgfile"

```shell
make && make install
    ...
    make    INSTALL_TO_DIR="/usr/local/mysql-5.1.70/mysql-test" install_test_files
    make[4]: Entering directory `/root/software/mysql-5.1.70/mysql-test'
    ...
```

> 注意，编译安装这个阶段会停大约10分钟，需要耐心等待一下

```shell
# 创建一个软连接
ln -s /usr/local/mysql-5.1.70 /usr/local/mysql
/usr/local/mysql/bin/mysql_install_db --user=mysql

# 复制配置文件，选择一个合适的，然后再改配置
cp support-files/my-small.cnf /etc/my.cnf

# 启动服务
cp support-files/mysql.server /etc/init.d/mysqld
chmod u+x /etc/init.d/mysqld
/etc/init.d/mysqld start
    Starting MySQL. SUCCESS!

netstat -an | grep LISTEN | grep 3306
    tcp  0   0 0.0.0.0:3306     0.0.0.0:*    LISTEN

# 设置开机启动
chkconfig --add mysqld
chkconfig mysqld on

# 配置默认密码，初始密码为空
/usr/local/mysql/bin/mysql_secure_installation
```

> PHP远程连接MYSQL速度慢,有时远程连接到MYSQL用时4-20秒不等
>
> 而本地连接MYSQL正常,出现这种问题的主要原因是,默认安装的MYSQL开启了DNS的反向解析,
> 在MY.INI(WINDOWS系统下)或MY.CNF(UNIX或LINUX系统下)文件的[mysqld]下加入`skip-name-resolve`这一句