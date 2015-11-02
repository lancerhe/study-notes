> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=400105611&amp;idx=1&amp;sn=f6cef185639b0ee34b224cd2ef58f9d7&amp;scene=1&amp;srcid=1022WhptYYxQYYfMXKflY2xm#rd>

#### 今日话题

讨论下redis集群方案以及遇到过的坑

1. twemproxy，codis，未来的redis-cluster，codis的作者出来创业了，但是一直很活跃 - hello
2. Redis cluster 以后的趋势 - 如末
3. 胡兰tv已经用redis cluster了 - sky
4. codis组件太多了，但是周边工具很配套 - hello
5. 目前在用Twemproxy做集群 git上这个已经很久不更新了， Twemproxy支持的命令也有限， - hey
6. 市面上最多的估计据就是它了 官方的cluster还不成熟稳定 Codis 其实也不算成熟 - 如末
7. 目前的redis基于2.6自己定制的...... - tiyee
8. redis集群 我自己之前的操作方法是直接利用redis_sentinel 一主多从 故障之后 选举出新的master 多个master之间利用一致性hash做分配 - lawlielt
9. 偷偷抛个小炸弹：  
主redis做数据变更，从做数据查询，但从会产生临时中间计算器数据，这样子大家认为对主从同步是否有影响？为啥[偷笑] - 乔楚  
回: 万一全部同步的话 中间数据岂不是被覆盖了？如果是命令同步 竟然同步必然会涉及到一个类似于什么命令缓存偏移的问题吧 更新操作 会不会影响从库的同步点的问题，主从也要考虑很多问题的 类似于故障迁移 扩展之类的 - lawlielt
10. 其实很想知道有将red is cluster 官方版那个用起来的吗？我之前收到试用过几次，还挺好用。就是phpredis 扩展缺乏支持 - 如末
11. 我有用过，不过被phpredis坑死了，估计没有proxy不行 - Huangsir
12. 确实phpredis 对集群用起来很蛋疼。昨天看了下，Predis 这个代码扩展。倒是用起来很好用。但是估计效率差点 - 如末
13. 豌豆荚分布式Redis的设计与实现 http://www.infoq.com/cn/presentations/design-and-implementation-of-wandoujia-distributed-redis - 昱北


#### 分享链接

1. 多人开发的 Git 流程 http://gold.xitu.io/entry/56263cfd00b0023ca69de5ec - ShiverySea
2. 维护一个大型开源项目是怎样的体验？ http://www.zhihu.com/question/36292298/answer/67049956 - 猿蜗
3. MariaDB 10.1 每秒可处理一百万查询 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=400055734&idx=1&sn=d04822306c80e5bf00203cecda1dfdaf - tony
4. 无线APP日志上报优化实践 http://mp.weixin.qq.com/s?__biz=MjM5ODYxMDA5OQ==&mid=400110965&idx=1&sn=d105f59c78bfaaab943e0e0bde925d99 - 朱政国
5. 西部数据宣布190亿美元收购闪迪SanDisk http://mp.weixin.qq.com/s?__biz=MjM5MzM3NjM4MA==&mid=400599228&idx=1&sn=43287d40a9c8421214fcf608861e90c9 - @理鱼
6. 微服务年度总结，看完这个你应该知道如何回答别人的问题了。 http://mp.weixin.qq.com/s?__biz=MzA5ODM0NjA3NA==&mid=400146790&idx=1&sn=5cba6e9f90db52dc6d9010c3237c1902 - @理鱼
7. PHP 性能优化 http://mp.weixin.qq.com/s?__biz=MzAwNjMxMTA5Mw==&mid=400058189&idx=1&sn=bada7be26e1d33071af23e6765ef8a51 - 黑夜路人
8. Redis数据结构与存储 http://shift-alt-ctrl.iteye.com/blog/1874693 - 程序员朋
9. Nginx image processing server with OpenResty and Lua http://leafo.net/posts/creating_an_image_server.html - 姚文强
10. 构建高性能web之路------mysql读写分离实战 http://blog.csdn.net/cutesource/article/details/5710645 - 黑夜路人