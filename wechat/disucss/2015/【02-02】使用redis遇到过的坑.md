> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=204534500&idx=1&sn=2f6a9257eff4577d649e024271ba711b&scene=1#rd>

1. 一台机器好几个redis的instance，有几个是master，然后另一个机房网络挂了一段时间，重启redis做全量的同步，结果同步的数据一直不对，原因是因为同一台机器上面的redis指定的dump路径是一样的,结果串了 - xman

2. redis  内存控制不好，结果是灾难型的，吃过亏  换ssdb  了 - Madman

3. bgsave,内存要升一倍 - linbo

4. 然后不要同时重启所有的slave，这样内存可能会升好几倍 - xman

5. redis的pub/sub结构，如果主从出现问题，主库会一直在内存保留需要pub的数据，导致内存暴涨，而且目前pub/sub没有超时抛弃，没有内存限制，暂时无解。 - 付坤 

6. Redis用快照模式持久化，如果剩余内存不足REDIS占用内存会导致进程崩溃退出，快照模式也会因一些误操作导致数据丢失 - mosen

回: 持久化一直是redis诟病 - 凹凸曼

回: 搞个slave啊，在slave上做持久化 - 叶金荣

7. 有人喜欢用REDIS取代MEM做缓存，这里有些坑，REDIS持久化会影响缓存操作，超过设置的最大内存有可能会导致无法写入数据
REDIS清理内存的机制和MEM不同，要小心使用 - mosen

8. 这个老王有几篇文章写的不错。。记Redis那坑人的HGETALL http://huoding.com/2013/01/21/214 - tywei

9. 哈哈。都被坑过。之前用socket和redis 搭建一套及时聊天室。采用的是它的pub  sub 模式。每次都要new 2长连接。直接把redis 搞挂了。
后来用socket的join代替了。redis 只负责存储。并加入redis 连接池。 - 如末

10. redis值太大导致整个redis服务异常. 大概有几m，这个事情害得我们服务中断了好几个小时. 另外遇到一个问题是分布式redis的时候值不过期 - 亿光年

问: 正常就需要存几M的数据吗，还是那次也正好是异常呢 - 叶金荣

回: 一直都那么存，但那次就异常了. 取出来数据是乱码 - 亿光年
当时我们用的是分布式的redis，后来迁移到单点时候才没问题
我们这边自己实现了一个分布式redis，但感觉老出问题
具体怎么实现的就不大清楚
后来问了些人，redis值最好不要大于5k，不然容易出问题 - 亿光年

11. 还遇到个问题是redis队列值写不进去也读不出来
重启都不管用
我们当时用的是分布式的，内存应该不会崩 - 亿光年

回: 那要看分布式的实施方式了
如果是预估数据量然后设死节点数的，肯定会崩啊
要想完全动态扩容，很复杂的，像淘宝的tair
redis是全内存的，值很大就会塞满内存
看你key数量了，几千个就好几g了 - 仲晨

12. 还有一个很坑的问题是PHPredis版本问题导致redis不能正常的序列化. 好像是PHP5.4. 跟PHPredis版本不兼容. 所以我们现在都不敢直接存数组了.我们用起来读比较多，写比较少 - 亿光年

13. redis默认还会fork后本地备份，如果写入频繁，内存更容易爆 - 仲晨

14. 数组如果可以无序，可以用hash，否则可以用igbinary或者json编码一下，直接存是怎样的做法？ - shawnvan

回: redis的值是可以直接存数组，内部会给你序列化的，那次出问题后我们都自己json或者序列号成字符存进去 - 亿光年

15. 使用redis常见的错误就是，没有设置IP限制、没有设置密钥访问，导致暴露公网任意连接 - 昱北

16. 以前碰到过个小问题，用来存放高频度验证，每三分钟更新周期的，过滤器～开始就是用类别存放，当某一类或几类的值颗粒过多就会出现问题～类似刚才那位说的key的坑大约20k的颗粒，有些十来万个，有些几十万个。 - xingxing

17. key value的用法，value值不能太大的问题我们也遇到过，单纯的key value用法倒不如用memcache.以前在这里分享过，还是多用用其他数据结构 - 零度西瓜

18. 前段时间做活动，赶急上，对类型和数据结构没有很好的规划，现在查询起来分析key都头痛。 - 慕枫

19. redis的ttl，值改变后要重新设置的 - shawnvan

20. 由于redis单用户单进程，批量数据处理可以用管道pipeline - 林志勇

21. Redis主从结构中，在不读取master中已经过期key的前提下，slave中的key短时间内不失效问题。Redis在实现GET、MGET、HGET、LRANGE等所有涉及到读取master数据的命令时都会调用expireIfNeeded函数被动触发失效，而且Redis的主动触发失效为了节省CPU资源不能全部及时的解决这个问题。
做了主从读写分离的系统，如果读永远在slave上，这个问题就比较严重，这是平时遇到的一个问题。 - 32f75a03d

22. 使用redis常见的错误就是，没有设置IP限制、没有设置密钥访问，导致暴露公网任意连接 - 昱北

回: 密码我觉得没必要设置。IP搞成localhost就可以了。 - 如末

回: 内部IP鉴权就够了吧,不对外开放 - 林志勇

回: 最好是ip加密码，因为很多情况下是内网网段授权，入侵内网一台服务器，开个扫描器直接扫，那也暴露了。 - 昱北

23. 之前在Redis的使用中曾经将设置的最大内存写满了，没有设置maxmemory-policy的情况下导致服务报错，无法继续写数据，追查源代码发现是因为由于内存不足，rdbSaveBackground函数中无法fork进程回写数据爆出异常。 - 32f75a03d

【分享链接】

1. CVE 2015-0235: GNU glibc gethostbyname 缓冲区溢出漏洞 http://drops.wooyun.org/papers/4780 - 黑夜路人

2. Not So Spooky: Linux “Ghost” Vulnerability http://blog.trendmicro.com/trendlabs-security-intelligence/not-so-spooky-linux-ghost-vulnerability/ - 张洋

3. CVE-2015-0235：Linux Glibc漏洞检测方法及修复建议 https://sobug.com/article/detail/9 - @理鱼

4.  Nginx(PHP/fastcgi)的PATH_INFO问题 http://www.laruence.com/2009/11/13/1138.html - 光阴的故事

5. 【原创】NLP中的中文分词技术 http://mp.weixin.qq.com/s?__biz=MjM5MDg2NjIyMA==&mid=203735010&idx=1&sn=c38894ca1fc7a4a0535f3d188c391a86 - 黑夜路人

6. A PHP-Client for MySQL Binlog https://github.com/BullSoft/php-binlog - 种树人

7. mysql binlog in realtime http://guweigang.com/blog/2013/11/18/mysql-binlog-in-realtime/ - 阿芳

8. 程序员中的数学——0 https://www.evernote.com/shard/s194/sh/88eade1d-0894-4b20-b8aa-18c68f0e540c/bb8bf6e113878bbf - 廖强

9. 《理解锁和信号量》https://www.evernote.com/l/AMJotoXzvz1KsaCfprhzjQqqyiZ0Hhcl2Fo - 廖强

10. 概率论的一点学习笔记https://www.evernote.com/l/AMIilRAt1vBLao1Mewcsb7VLtts9HdVX2jo - 廖强

11. 《多线程队列优化算法》https://www.evernote.com/l/AMKEVxXGGi1A6KKs1oNlRX-Iwe2lvbv2gEA - 廖强
