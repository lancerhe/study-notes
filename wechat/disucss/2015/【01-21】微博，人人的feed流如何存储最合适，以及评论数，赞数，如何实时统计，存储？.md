> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=204117528&idx=1&sn=cc609da770da2c044e31e529b3925828&scene=1#rd>

1. 微博feed可以看看杨卫华的博客，http://www.infoq.com/cn/presentations/feed-stream-architecture-in-big-data-era - 昱北

2. 我觉得分推和拉两种，推就是一个人产生feed，推送到每个好友的feed列表，拉反之. 评论、赞这类，关键是高性能，扛得住。用kv高性能，用消息队列扛住峰值。 - 仲晨

3. 问: 并发时最大，而且要求实时展现。放到队列中会不会造成延迟？ - stuart

回: 统计数字有延迟总比用户点击后加载不出来要好啊 - 仲晨

4. 问: 推这种，处理比较复杂呀. 如果 用户的关系变化了，这种处理起来很复杂吧 - smarteng

回: 复杂也没办法啊. 靠拉的话，对于关注了很多人的情况，消耗太大 - 仲晨

5. 问: feed也就是关注的那批用户的一个动态按照时间抽显示。那这个时间轴数据是怎么存储呢？？是关注的那个用户发了一个动态就插入到被关注的临时时间轴数据中（可以是redis数据库）？如果是这样那一个用户被1000万人关注了，难道还要循环1000万次去插入数据？另一种是拉取得时候去获取用户的关注列表里面的用户的动态（在mysql这样好像的关联查询），那效率就很低了。请问微博、人人存储feed信息是怎么个机制呢？？？ - Dojack

回: 半推半拉吧，根据规模动态约定。比如超过多少人在inbox，不足就在outbox中. - 青衫隐_刘

6. 假设a登陆，a首先读取自己的inbox，可以是redis里面写好的feed。然后读取此用户关注的大V，所谓的粉丝1000w这种用户的outbox，拉取下来存储到自己的inbox里面。然后排序显示出来…这是能想到的…不知道对错
毕竟1000w的粉大部分不会及时登录也不会马上查看消息，所以感觉用pull会好过push…个人意见 - 青衫隐_刘

7. 嗯！对，如果发了一条动态就往关注他得用户的feed里插入一条数据，不光粉丝多时会耗性能！而且很多他的粉丝是不登录，写了也是白写！ - Dojack

8. 大数据时代的feed流架构 http://www.infoq.com/cn/presentations/feed-stream-architecture-in-big-data-era?utm_source=tuicool - xman

9. 在线的推，不在线的拉。1000w的粉丝估计有10w在线已经很不错了
不在线的实时推意义不大吧
微博我猜每个人上线下线都会通知粉丝，关注者
然后每个人都有个当前在线的粉丝集合，当前在线的关注者集合 
收发feed的时候，你懂的啦。。。
这只是猜的，不知真实是不是酱紫 - 种树人

10. 在线的推，登陆频繁的推. 整体上就是大v发布的进行拉，一般用户发的进行推 - 仲晨

11. 微博消息队列架构分析 http://mp.weixin.qq.com/s?__biz=MzA5MTE0MDUxMA==&mid=201835019&idx=1&sn=9c9e5565790b8380bc535ea1f618c192 - 青衫隐_刘

12. 亿级用户下的新浪微博平台架构 http://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=203713008&idx=1&sn=b493d52bc9aa9676a7a602d10cbc880d - 黑夜路人

13. 新浪微博用的貌似是redis+ssd cache+mysql - 朱建锋

14. 新浪微博Feed服务架构 http://www.slideshare.net/XiaoJunHong/feed-26666858?related=2 - 阿芳

【分享链接】

1. IT蜂客｜Go语言的并发模式 http://mp.weixin.qq.com/s?__biz=MzA4MDEwMTMyMA==&mid=203433639&idx=1&sn=151881c50aea98d298eaaf55709bbf2d - 黑夜路人

2. 观察 丨腾讯深度布局微信 你是下一个受益者吗？ http://mp.weixin.qq.com/s?__biz=MjM5OTM5OTAyMQ==&mid=204688375&idx=2&sn=14e9b4401e2959526bd38933fe38eab4 - 水浸街