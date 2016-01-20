> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=401391321&amp;idx=1&amp;sn=6454c41e3745c65bb2fc77d5df81ea55&amp;scene=1&amp;srcid=1223mDtlIFa32c0HufO8Rb4Q#rd>

#### 今日话题

讨论下elasticsearch的使用情况,与周边产品,如logstash和rsyslog的结合

1. http://learnes.net/   Elasticsearch 权威指南 http://kibana.logstash.es/ ELKstack 中文指南 - 老虎  
回: 文档有点跟不上，es2.1版本了，更新还挺大  
在sphinx中有个功能叫mva多值属性挺好用，在es搜索中感觉没找到正确的姿势 - 杨恒飞  
回: 那个elasticsearch的权威指南已经有点过时了，建议去官网直接看doc - 廖强
2. 2.1的新版本默认配置文件中参数太少，还需要翻墙看英文网站。。比较麻烦，sphinx分布式不太好，最近看新浪的一大拿的微博，说使用rsyslog代替了logst去处理日志数据，性能提升了很多。有了解的没？ - 斯图尔特
3. 我听说的不少用flume处理日志的 - 杨恒飞
4. 也了解过，主要是 elk这个算是一套的，我理解，他的每次更改就已经重建索引了 - 斯图尔特
5. 搭了一个 好像对编码有要求，有个开源的kiniba 好像是叫这个 做日志监控蛮好用的 - 阿哄
6. 之前我把我们公司的搜索迁到了elasticsearch上，还有就是目前的监控相关的也用的这个，kibana是做数据图形化的，底层数据用的是elasticsearch上的，日志收集的有logstash，也可以自己写， - 廖强
7. 恩 它底层就是elasticsearh，不过我用的flume 做的日志收集 在storm 里数据做了处理再传到搜索里的 对一些乱码 会报错 还没空去查，我用的比较浅 感觉和数据库差不多  就是搜索比较方便点，好像聚合去重上也不太好使，我没找到 看的例子只有聚合后的数量 没有数据 - 阿哄
8. 简称elk，我们也在用，平时查询日志确实蛮方便的 - 如末
9. logstash本来还可以做得更好的，在匹配的时候，正则匹配容易回溯，如果能提供基于字符串的过滤后再正则，就会过滤很多没必要分析的日志，性能会好很多，可以考虑重写一个，有数据的，你可以查一下elasticsearch的聚类语法 - 廖强
10. 访问日志先存到kafka。再用nodejs 消费存到elasticsearch，分析页面用了 js 和php的api，js的api 还是比较强大的。 - 弹痕
11. 问: 这个你测试过kafka到elastic的消息丢失率多少？ -  
回: 本来就主动丢弃了一部分， - 弹痕  
回: 我是比较担心这个架构里面的日志丢失  
我最近也在考虑类似的架构，但是比较担心log丢失 - 谢孟军  
回: 日志本来就没有全部记录，所以不存在log丢失的情况， - 弹痕  
回: 那就用静态的Hadoop Hive - 大饼
12. 之前谈论的elastic的丢失，前几天看到这个http://www.elain.org/?p=995 (EFK日志收集丢失率测试报告)，测试显示丢失率，让我好担心这样的方案 - 谢孟军
13. Elasticsearch 学习笔记http://neway6655.github.io/elasticsearch/2015/09/11/elasticsearch-study-notes.html - 梦想旅程
14. 问: Es可否指定jdk环境变量？  只想单独给es指定 不能全部改掉 - tiyee  
回: @tiyee bin/elasticsearch.in.sh里面设置Javahome - 每周

#### 分享链接

1. 京东技术架构之构建需求响应式亿级商品详情页 http://mp.weixin.qq.com/s?__biz=MjM5NTg2NTU0Ng==&mid=404554543&idx=2&sn=f9c71cdb5249e7f1f7134383fbf0bae8 - 黑夜路人
2. 手机QQ公众号亿级消息实时群发架构 https://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=403014743&idx=1&sn=a08c577ac9d19718039d0eba0c002707 - 小二儿
3. 千万级规模高性能、高并发的网络架构经验分享(转载） http://mp.weixin.qq.com/s?__biz=MzAwNjE3ODQ4NQ==&mid=401559456&idx=1&sn=268dbe9abb96ae9f4fa635ffadab8594 - 轻裘长剑
4. PHP local cache 我写的一个本地缓存扩展 https://github.com/liexusong/pcache [呲牙] - Lie_旭松
5. 亿级商品详情页架构演进技术解密 https://mp.weixin.qq.com/s?__biz=MzIwODA4NjMwNA==&mid=401495462&idx=1&sn=fa8a2bb2f25274f3d839c8af7732d825 - 陈阳
6. 阳振坤深度解析OceanBase如何支撑支付宝双十一14万/秒笔交易 http://yq.aliyun.com/articles/217 - 张静小朋友
