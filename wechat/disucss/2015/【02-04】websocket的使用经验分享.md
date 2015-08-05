> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=204584775&idx=1&sn=489362fccb77ae8103126e248875973e&scene=1#rd>

1. 在Python的tornado框架里有内置websocket框架支持，使用起来是很方便，但貌似也要加心跳，否则在隔了一段时间后就无法通讯了，不知各位有没有遇到这样的情况？原先对这个不太了解，以为不用，结果发现还是要-_-|| - yongsean

回: websocket心跳不是协议里的么, 什么时候跑到应用层了 - flea

2. 问： 有人在手机端native用websocket吗 - kunsir

回: @kunsir go push 的客户端貌似用这个 - 刘天昭

3. 在线聊天正在用，用socket.io开发完后又切到了sockjs，存储用ssdb的list，喜欢sockjs的小巧，也受这篇文章影响了http://xsnippet.org/359042/，还同步有一个tornado的后端实现做备份，还没机会用上，量不大一直比较稳定 - Garfielt-刘卫涛

4. 在用go.net/websocket，里面有个自动回复心跳ping的bug - M20

5.websocket 用的最爽的就是用socket.io了。node平台的。 - 如末

6. 最近在用swoole的ws做项目，用起来还可以，还没上线 - lwPan

7. 我记得以前用socket.io就是ie有个版本报错，应该就是跨域问题，一直没解决，好在是内部系统，无所谓 - bananaliu

8. 问: swoole都应用在什么使用场景？类似聊天通讯之类的？ - star

回: 用php写长链接的东西 - lwPan

回: 为什么要用php写长连接呢？ - 廖强

回: 类似于微信扫描登录，就是用长连接吧 - 昱北

回: 嗯。php不擅长长链接应用，刚好swoole 弥补了这一空缺，所以有很多人愿意试试它。
因为是php的。学习成本低一点 - 如末

回: 对swoole不太熟悉，主要是担心稳定性和性能的问题。总觉得这类场景不适合php - 廖强

9. 百度复合搜索貌似用的就是swoole和lua - tiyee

回: @tiyee 我们确实在用swoole和openresty swoole做后端服务还没有上线检验 开发很方便 - ysq

10. 问: 有用redis和websocket做聊天的么？ - Lphy

回: 我们就是这个模式 - xingxing

11. 大体上：前端JS+Flash通过TCP长连接与聊天服务器保持（自主实现心跳）；聊天服务器将数据包通过Lua转发（分发）至Redis队列；（这是数据下行方式）；后端进程扫Redis队列，数据处理后再封装通过Lua转发（分发）至聊天服务器推送接口，最终推送到客户端；（这是数据上行方式）；
中间所有的环节都是自主开发，无任何开源项目。 具体细节不太好分享出来~ - xingxing:

回: 还flash。。。这是什么时候的设计？ - 陈一回

回: @陈一回 四年前

12. PHP我记得有个基于workerman的 - 慕枫

13. http://blog.csdn.net/shagoo/article/details/6396089 这个socket系列还不错 - 慕枫


【分享链接】

1. DB-Engines 2015 年2月 数据库排名公布【MongoDB 超越 PostgreSQL 排名第四】 http://mp.weixin.qq.com/s?__biz=MjM5NzM0MjcyMQ==&mid=202624631&idx=1&sn=14512560f9aecec3a71d28e6b9e0919a - John

2. Nginx location 配置踩坑过程分享 http://blog.coding.net/blog/tips-in-configuring-Nginx-location - 老虎

3. 理解php对象注入 http://drops.wooyun.org/papers/4820 - 念念念恩他爹

4. Go System Programming https://github.com/astaxie/go-system-programming - 谢孟军
