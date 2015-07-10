##### 创建项目
```bash
/usr/local/svn/svnadmin create /data/svn/mdoc
vim /data/svn/mdoc/conf/svnserve.conf
    #匿名访问的权限，可以是read,write,none,默认为read, 去掉前面的#
    anon-access = read
    #认证用户的权限，可以是read,write,none,默认为write, 去掉前面的#
    auth-access = write
    #密码数据库的路径, 去掉前面的#
    password-db = passwd

vim /data/svn/mdoc/conf/authz
    lancer=rw

vim /data/svn/mdoc/conf/passwd
    [users]
    lancer = 123456

/usr/local/svn/bin/svnserve -d -r /data/svn/
```

##### 初始化项目
```bash
cd /var/www
svn co svn://192.168.236.61/mdoc
cd mdoc
mkdir trunk branches tags
svn add branches/ tags/ trunk/
svn ci -m "Init svn repository."
```

##### 在主干上开发
```bash
cd ../
rm -rf mdoc
svn co svn://192.168.236.61/mdoc/trunk
```