## 下载源
[http://subversion.apache.org/download/](http://subversion.apache.org/download/)

## 安装
```bash
yum remove subversion
wget http://mirrors.cnnic.cn/apache/subversion/subversion-1.8.10.tar.gz
tar zxf subversion-1.8.10.tar.gz
cd subversion-1.8.10
./get-deps.sh

cd apr
./configure --prefix=/usr/local/apr
make && make install

cd apr-util
./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr/bin/apr-1-config
make && make install

cd ../
./configure --prefix=/usr/local/subversion-1.8.10 --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util
make && make install
```