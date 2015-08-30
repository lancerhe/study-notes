> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=210695212&amp;idx=1&amp;sn=d83729d7b7ce64c1a4145ad47f8268f8&amp;scene=1&amp;srcid=YQmFfS9j22I0uZD2o23U#rd>

#### 今日话题

docker的使用情况,应用在哪些场景?

1. 可以用来管理个人开发环境 - 小火箭
2. docker加virtualbox 加vagrant[呲牙] - 姚文强
3. 问: 不知道vagrant和docker的区别是啥 - yongsean  
回: 硬件虚拟，进程隔离？vagrant只是一个管理虚拟应用的工具吧 - linbo
4. docker只适合无状态的应用 - 种树人
5. 我们现在用docker做开发环境了，每人本机部署一套，不用跑到开发机上工作, 接着是要把运维工具转为docker部署 如果io 内存没问题 再推广到线上,现在jenkins的测试也有用docker 如果跑起来不慢 也可以试试 - twin
6. mac下比较大的坑是用vbox共享 io非常差 require一个类 差的时候要10多ms  经常因为io卡主 一个请求下来要几秒 改为nfs整体大概10%提升 还有不卡了 但可能会遇到权限问题 再开启opcache就正常了 只是偶尔会缓存住文件 更改不生效 - twin  
回: 这个确实很坑，之前以为是代码问题，排查了好久才发现原来是共享io的问题 - Max
7. 问: docker 是只读容器的话，应用程序产生的动态数据是保存在哪里的? - 郭煜彬  
回: volumn映射过去呀 - HuangSir
8. 用docker1.6.2，不要用1.7.0 Centos不要用6，用7 - 廖强
9. 用来做测试环境 测完能够直接回滚数据 线上就暂时没想到有什么特别的优势 - HuangSir  
回: 快速扩容 - Foo  
回: 统一环境就是很大的优势了 - twin  
回: 目前我们环境还是统一的[发呆]  
目前只解决系统版本和采购的网卡芯片兼容性不太好的问题 - HuangSir
10. kubernetes管理docker，扩容，上线 - 张涵

#### 分享链接

1. 低成本和高性能的MySQL云数据库的实现 http://mp.weixin.qq.com/s?__biz=MjM5NDMwNjMzNA==&mid=207911972&idx=1&sn=58813c9875915c7ff2a29aaa0048f21f - 猿蜗
2. 如何实现支持数亿用户的长连消息系统 | Golang高并发案例 http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209727496&idx=1&sn=86b64ddadcc91bc6b0741a870692b3c0 - 黑夜路人
3. 秒杀系统架构解密与防刷设计 http://mp.weixin.qq.com/s?__biz=MzAxNjAzMTQyMA==&mid=208119608&idx=1&sn=46e50d594d04df4f2b0d650df6864daa - 黑夜路人
4. DevDocs is a fast, offline API documentation browser with 60+ docs including HTML, CSS, JavaScript, PHP, Ruby, Python, Go, C, C++, jQuery, and more. http://devdocs.io/ - 默然