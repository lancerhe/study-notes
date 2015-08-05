> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=209756231&idx=1&sn=a59a220b7d0b9be8e60933bac5b2925c&scene=1#rd>

【今日话题】
Nosql的事务实现经验 - Garfielt-刘卫涛

1. 五个解决方案让MongoDB拥有RDBMS的鲁棒性事务 http://www.lupaworld.com/article-241726-1.html - Garfielt-刘卫涛

2. 最近正在试着给mongo加事务，目前的处理是设计上尽量利用其自身的原子操作，然后利用flag做二阶段提交 - Garfielt-刘卫涛

3. 一个数据结构维护事物信息，加上原子锁
如果用上hash 8字的原子性，是不是就无锁了 哈哈 - 金灶沐

4. redis本身是支持事务的，multi，exec，discard - 杜世伟

5. 脱离应用场景谈事务就是耍流氓啊。考虑一致性的情况下，如果是ReadSerialize的隔离级别，基本的nosql都可以用，所有读写加锁，按照两阶段提交，写一个就ok了。这样的设计基本是不可用的，读写冲突太大，并发根本上不去。如果是RepeatableRead的隔离级别，基本的做法就是同一份数据要有不同的历史版本，事务之间可见性的定义，多版本并发控制。所以呢，如果对一致性和事务有强的需求，还是用mysql吧。如果对一致性要求比较低，折衷的做法就有很多了 - 廖强

6. 记录操作，如果中途有一个失败，就根据记录逆操作，还原到操作前状态 - tiyee

【分享链接】

1. 更好的 SQL 模式的 10 条规则 http://mp.weixin.qq.com/s?__biz=MjM5ODAzODgyMQ==&mid=206970971&idx=3&sn=f00164885f0d7a8368bff394883b0b71 - @理鱼

2. Nginx 引入线程池，提升 9 倍性能 http://mp.weixin.qq.com/s?__biz=MjM5MzA0OTkwMA==&mid=210006016&idx=1&sn=d1374664f749b556cf044a4283521d27 - Jesse

3. Dapper，大规模分布式系统的跟踪系统 http://bigbully.github.io/Dapper-translation/ 生产环境下分布式系统跟踪。开源实现有twitter的zipkin、sourcegraph的Appdash… - 无明火

4. 「程序员干到三十就干不动了」的说法是从哪来的？ http://mp.weixin.qq.com/s?__biz=MjM5ODAzODgyMQ==&mid=204895855&idx=1&sn=e9d5f17ffa594d95df26ba1b55e0b511 - 飛魚

5. 春哥對線程池的看法 http://m.weibo.cn/1834459124/3859165947030514/weixin - Pahud