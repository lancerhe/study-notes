编译SVN扩展要注意，指定对应的svn安装路径，以及apr安装，还有引入arp-util的部分C头文件

    export CPPFLAGS=-I/usr/local/apr-util/include/apr-1/
    export LD_LIBRARY_PATH=/usr/local/subversion/lib
    ./configure --with-php-config=/usr/local/php/bin/php-config --with-svn=/usr/local/subversion-1.8.10/ --with-svn-apr=/usr/local/apr
    make
