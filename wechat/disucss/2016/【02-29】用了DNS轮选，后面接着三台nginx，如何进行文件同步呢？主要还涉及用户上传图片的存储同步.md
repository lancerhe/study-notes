> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=402164355&idx=1&sn=745fe7cca5504714197f493af191d99d&scene=23&srcid=0301YaRXYvC0OjFdpVRf54pO#rd>

#### 今日话题

用了DNS轮选，后面接着三台nginx，如何进行文件同步呢？主要还涉及用户上传图片的存储同步

1. sync或nfs --yongsean

2. 大公司用存储！小公司用NFS --马振国

3. 以前都偷懒。。。直接mount..... -- 膘叔 ‍小小


5. 上传图片，还有一些网站使用的图片，我们都在用七牛。 --斯图尔特

4. 怎么保证一致性？ --lixusong  
NFS 本来就是一份数据 不需要考虑一致性 --马振国  
不考虑一致性就会出现404  
NFS 不会出现404 --马振国  
nfs是怎么个原理？ --lixusong  
网络磁盘 和 samba 的效果一样 nfs 网络共享 --(yongsean Leandre 亮亮)

5. Rsync ！用户上传图片到指定的服务器！这个服务器作为主服务器！其他服务器来这个主服务器实时同步数据！切记在同步的时候不能加DELETE 参数 NFS 就一份数据 不需要保证一致性 --马振国

6. 可以做实时备份的！但是只有一份数据为用户提供服务 --马振国

7. 一切挂载行为都会有单点和读写瓶颈 --学在囧途

8. 图片等文件不多 nfs可以满足 多起来可能不适用 --亮亮

9. 小文件目前我觉得seaweedfs更好 --yongsean

10. 没必要做同步，保证能找到就可以了~ 做好备份即可 --学在囧途 

11. 图片走静态域名，走Cdn --阿胡

12. dns轮询需要注意健康检查的问题 --随手写的

13. powerdns可以了解下 --随手写的

14. 我们用mongodb gridfs解决了 数据量不是那么大，gridfs 分布式存储，支持nginx插件直接读取文件，我们是用nodejs挂在前面 ，会对图片做动态大小缩放 - 影子

15. 国外貌似都用ceph - 梦幻

16. 我们有专门的图床服务，不知道用的啥，估计是文件系统和imagemagic - tiyee

17. 比较过不少分布式文件系统，mongodb 最容易实现，性能上数据量不大 还是没问题的，hdfs之类做后台数据处理可能较好，但是对读取实时性较高的就不行了- 影子

18. 不是有hbase啊 - 梦幻

19. 我们就用的fdfs，简单易用，性能也不错。 - 幻觉大的很

20. 我们公司自己开发的ugc服务。专门存储文件。小文件存在公司的服务器。大文件存在例如七牛这种第三方里。这样。无论多少台服务器。一个文件资源就对应着一个ugcid。所有的文件存取都通过这个ugc service 进行。根本不需要同步文件 - 熊mao

21. fastdfs应该是fds里面最简单的一种了 - akin520

22. 用户上传的图片太好处理了，直接一台专用图片服务器。公用 - 李三

23. azure自带CDN无限扩容自动备份异地容灾 - 钟鹏华

24. 存到cdn，前端机定期备份到数据机 - Moses‍的‍理‍想‍國

#### 分享链接

1. 【技术领导要不要写代码？】 
http://mp.weixin.qq.com/s?__biz=MzA3MDMwOTcwMg==&mid=402016045&idx=1&sn=96272a1651edc1c3824c66058a91e6f6&scene=1&srcid=#rd

2. 【开源实时日志分析ELK平台部署】
http://www.tuicool.com/articles/QFvARfr

3. 【使用elk+redis搭建nginx日志分析平台】
http://sc.qq.com/fx/u?r=etcpTsA

4. 【Golang在视频直播平台的高性能实践（含PPT下载）】
http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=404230356&idx=1&sn=6b73f971c4cf1170adaf4d249480ed9a&scene=1&srcid=0301g3VUDSiwJfWFMNA4vXj8#rd

5. 【搜索智能提示suggestion,附近点搜索】
http://m.blog.csdn.net/article/details?id=12752317

6. 【百度 - 搜索框的suggestion】
http://www.cnblogs.com/huangwei1024/archive/2012/09/23/2699204.html

7. 【淘宝搜索下拉框查询词提示（Suggestion）原理】
http://www.tao-sou.com/821.html

8. 【浅解PHP DOS攻击 —— 如何玩坏PHP数组】
http://mp.weixin.qq.com/s?__biz=MzI0MjEwMDMzNQ==&mid=402992475&idx=1&sn=c294e416f83790007e0be857e3076ac7&scene=1&srcid=0301HNGo4kCKFionWfZqGNak#rd

9. 【《硅谷之谜》读后感（一）】
http://mp.weixin.qq.com/s?__biz=MjM5ODY0NTY0MQ==&mid=403513040&idx=1&sn=859ec4fc36dfdf26eddbc14ad56cd640&scene=1&srcid=0229U26cpavSGIi3LGkhBZGe#rd

10. 【使用Nginx、Nginx Plus抵御DDOS攻击】
http://mp.weixin.qq.com/s?__biz=MzA3MzYwNjQ3NA==&mid=208998983&idx=1&sn=57c74bef6c19227660236fff74557c50&scene=1&srcid=1016w7ZDYGI9DVkRNtr8fNis&from=groupmessage&isappinstalled=0#wechat_redirect

11. 【唯品会NoSQL平台自动化发展及运维经验分享】
http://mp.weixin.qq.com/s?__biz=MzA3MzYwNjQ3NA==&mid=403037022&idx=1&sn=7cd23a314e11ca077d1f17661033b0c5&scene=1&srcid=0301o6Z4Kf0g1DbDYMHWsYRE&from=groupmessage&isappinstalled=0#wechat_redirect

12. 【菜鸟教程】
http://m.runoob.com/?from=groupmessage&isappinstalled=0