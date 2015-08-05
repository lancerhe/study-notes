```shell
#下载三个软件包，Yac暂时只有在Github上
wget http://pecl.php.net/get/yar-1.2.1.tgz
wget http://pecl.php.net/get/yaf-2.2.9.tgz
git clone https://github.com/laruence/yac.git
```

```shell
# Tgz包解压并进入文件夹，yar为例
tar zxvf yar-1.2.1.tgz
cd yar-1.2.1

# 编译扩展
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
echo "extension=yar.so" >> vim /usr/local/php/etc/php.ini
```