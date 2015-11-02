> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=400222475&amp;idx=1&amp;sn=33824b2e168d0322eabfa9e7bf1e5e13&amp;scene=1&amp;srcid=1030fuFXagI6urxhkamh1zOq#wechat_red irect>

#### 今日话题

mysql中间件的使用情况分享

1. 有很多开源的中间件  
360的Atlas，阿里的cobar、TDDL，mysql官方的mysql-proxy  
Atlas这个用的人比较多  
https://github.com/Qihoo360/Atlas/blob/master/README_ZH.md - 踏雪无痕
2. 试试oneproxy - 阿牛哥
3. Atlas我们也有用，还有haproxy  
不过haproxy只能用短连接  
还是挺方便的，MySQL需要换服务器或者ip什么的时候 - Huangsir
4. https://github.com/flike/kingshard/blob/master/README_ZH.md  
用Go来实现的，用的还比较少 - 踏雪无痕
5. 百度的mysql代理，其实分两个，一个是db proxy，一个是menu  
dbproxy的局限性在于，没有抽象逻辑表和物理表，业务层要掌握分库分表的规则。这个也带来一个好处就是，因为简单，所以更稳定和可靠  
menu解决了上述局限，不过复杂了很多，代码很复杂。之前我在mysql基础上做分布式事务的时候，也是在menu代码基础上进行写的  
吐槽一下，mysql通信协议有很多琐碎和蛋疼的细节，为了对外兼容mysql通信协议，实现了很多解析；另一个比较蛋疼的地方是，mysql client的api都是同步的，需要自己去实现很多底层细节来做成异步的 - 廖强
6. 1.Cobar：基于MySQL的分布式数据库服务中间件 https://github.com/alibaba/cobar  
2.TDDL：来自淘宝的分布式数据层 https://github.com/alibaba/tb_tddl  
3.Amoeba：开源的分布式数据库Porxy解决方案 http://www.biaodianfu.com/amoeba.html  
4.Atlas：来自360的MySQL中间层 https://github.com/Qihoo360/Atlas  
5.mysqlnd_ms 读写分离插件http://www.laruence.com/2011/10/05/2192.html  
6.OneProxy,OneSQL - 刘辉
7. 请教下，一般 ORM 框架都带读写分离，与中间件有显著区别吗？ - JoJo  
回: 都可以实现的。现在主流的一是在应用层写数据库路由，当然这个效率也是最快的，但是最大的缺陷就是运维难度大，技术难度也大，需要有强大的技术团队支持。第二个方案是proxy中间件，现在开源的中间件很多，比如TDDL、Cobar、Atlas、MyCat、Mysql Proxy、Oceanus等等，中间件的最大的好处是对数据层解耦，减轻了运维难度，当然在服务器层与数据库层加了一层proxy，使得效率明显不如直接访问数据库 - 踏雪无痕  
回: 最简单的从sql 判断下, select 默认走从。其它的增删改走主 就好了。最简单的就是：用这个正则匹配啊。sql 里面包含 select的。- 如末
8. 我对中间件有一些发言权 - 黑夜路人  
我是之前在百度上班的时候用了好几年  
百度的不是开源的  
了解过 taobao的tddl 、alibaba的变形虫、还有开源的MyCat  
我用过 SQL Relay、MySQL Proxy、百度的DBProxy、360的altas  
我用过360的altas 超过两年时间，表示稳定性非常好。  
容易使用，世面随时可以获取，稳定性不错的是360的altas   
技术质量最高的是百度的DBProxy  
这里面，架构设计最好的是阿里巴巴的corba和开源的MyCAT  
看过一些代码  
线上能力比较强的还是百度DBProxy和360的altas  
国外开源的 SQL Relay和MySQL官方的Mysql Proxy都比较弱，只能当做玩具。  
corba等的问题在于是java的，我对java程序的安装部署都比较讨厌，所以更喜欢c/c++开发的服务。  
包括在有事务，或者是查询很多的情况，都能够稳定使用。  
altas 在10000/s的请求量级应该是毫无问题的。  
今年年初在一个创业公司，使用altas超过3个月，经受住了考验。  
我跟开发altas 的作者深入交流过3个小时，对原理机制了解足够充分，比较可靠。  
9. 问: 线上使用 连接 qps 最大到过多少 - Peter  
回: 印象里能够跑到6w/秒 - 黑夜路人
10. 问: 它的 sharding怎么样 - 航行  
回: 它这个层面，不需要sharding 这种复杂华而不实的功能。开源的，如果需要sharding，可以考虑用 MyCAT - 黑夜路人

#### 分享链接

1. MySQL索引原理与慢查询优化  http://mp.weixin.qq.com/s?__biz=MjM5NDMwNjMzNA==&mid=400312380&idx=2&sn=cd54c0b28e21bd14fe2376eb97a683d0 - 黑夜路人
2. Cassandra分析 http://blog.csdn.net/kirayuan/article/details/6430889 - 黑夜路人
3. PHP对战Node.js：我们曾相爱，想到就心酸 http://mp.weixin.qq.com/s?__biz=MjM5MDI5MjAyMA==&mid=400167099&idx=1&sn=4c93fd716539c8d5419aa652b7a30f6a - 猿蜗
4. 开源还是商用？十大云运维监控工具横评 http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=402030116&idx=1&sn=e29e1da05129a5bbb7cc1c2a9191fb3e - @理鱼
5. 超级系统工具Sysdig，比 strace、tcpdump、lsof 加起来还强大 https://mp.weixin.qq.com/s?__biz=MzA3MzYwNjQ3NA==&mid=400257019&idx=2&sn=3e37dd36b2a522283482b05f790549d7 - 若凡
6. PHP 性能分析第一篇: XHProf & XHGui 介绍 http://news.oneapm.com/php-xhprof-xhgui/ - 黑夜路人
7. PHP 性能分析第二篇: 深入研究 XHGui http://news.oneapm.com/profiling-php-part-2-xhgui-in-depth/ - 黑夜路人
8. PHP 性能分析第三篇: 性能调优实战 http://www.tuicool.com/wx/qyieAn - 黑夜路人
9. PHP7新特性 What will be in PHP 7/PHPNG http://blog.csdn.net/hguisu/article/details/45094079 - 黑夜路人
10. 这才叫大数据！腾讯首次公布微信数据（完整版） http://mp.weixin.qq.com/s?__biz=MjM5MDIxNjU3OQ==&mid=400454658&idx=1&sn=51362affce9892fb8b9dfd1abaaa18b3 - Geoffrey
11. 世界上最好的语言将于2015年11月12日发布PHP7正式版 http://mp.weixin.qq.com/s?__biz=MzI0MjEwMDMzNQ==&mid=400565886&idx=1&sn=7ea9632f595295a79cd64ef267e20452 - 乔楚
12. Nginx流量拦截算法----电商平台很需要 http://mp.weixin.qq.com/s?__biz=MzI0MjEwMDMzNQ==&mid=400597655&idx=2&sn=3eb41a75d4371f5ea5abaa68e34d6b28 - 乔楚