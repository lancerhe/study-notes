## 带有https模式需要 serf支持

```
wget http://serf.googlecode.com/files/serf-1.2.1.tar.bz2
tar xjf serf-1.2.1.tar.bz2
cd serf-1.2.1
./configure --prefix=/usr/local/serf-1.2.1
make && make install
cd ..
rm -rf serf-1.2.1

tar zxvf subversion-1.8.10.tar.gz
wget http://www.sqlite.org/sqlite-amalgamation-3071501.zip
unzip sqlite-amalgamation-3071501.zip
mv sqlite-amalgamation-3071501 subversion-1.8.10/sqlite-amalgamation
cd subversion-1.8.10
./configure --prefix=/usr/local/subversion-1.8.11 --with-openssl --enable-maintainer-mode --with-serf=/usr/local/serf-1.2.1/ --enable-mod-activation
make && make install
cd ..
rm -rf subversion-1.8.10
```