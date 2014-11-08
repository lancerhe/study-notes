## 下载源
[http://code.google.com/p/git-core/downloads/list](http://code.google.com/p/git-core/downloads/list)

## 依赖包安装
```shell
yum install -y zlib-devel openssl-devel perl cpio expat-devel gettext-devel
```

## 安装
```shell
wget http://git-core.googlecode.com/files/git-1.8.3.1.tar.gz
tar -xvf git-1.8.3.1.tar.gz
cd git-1.8.3.1/
./configure --prefix=/usr/local/git-1.8.3.1
make && make install
ln -s /usr/local/git-1.8.3.1 /usr/local/git
ln -s /usr/local/git/bin/git /usr/local/bin/git
```

> make出错
> ```shell
> /usr/bin/perl Makefile.PL PREFIX='/usr/local' INSTALL_BASE='' --localedir='/usr/local/share/locale'
> Can't locate ExtUtils/MakeMaker.pm in @INC (@INC contains: /usr/local/lib/perl5 /usr/local/share/perl5 /usr/lib/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib/perl5 /usr/share/perl5 .) at Makefile.PL line 3.
> BEGIN failed--compilation aborted at Makefile.PL line 3.
> make[1]: *** [perl.mak] Error 2
> make: *** [perl/perl.mak] Error 2
> ```

看提示是perl的问题，`yum install perl-devel.i686`