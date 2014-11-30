新安装了python2.7.3

在linux下的命令行就变得不好使了

首先出现的是退格键，出现乱码。

变成命令行用的就不爽了，要退格的时候，还要按住ctrl才行。

查了下资料，据说是readline这个安装包没有安装导致的。

通过yum search readline查了下有两个包（readline.i386，readline-devel.i386）。安装下

最后重新编译python安装包