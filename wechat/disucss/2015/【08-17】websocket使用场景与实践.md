> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=210746774&amp;idx=1&amp;sn=b67f18da0931f27d844ea701795a9e5f&amp;scene=1&amp;srcid=bDszC5OUM8M3gKqv0za2#rd>

#### 今日话题

websocket使用场景与实践 - Albert

1. 个人觉得，这玩意主要用于聊天上 - yongsean
2. 实时监控 - ning
3. 在聊天的时候用过这个websocket，但是每个浏览器对它的支持不好，好像360浏览器就不支持 - 魏海龙  
回: socket.io可以降级 - 光阴的故事
4. 呼叫中心的前后端通信好像大多用的websocket - @carl
5. bs 要么长轮循 要么 websocket ，要么flash， ie有OCX - @理鱼
6. 游戏，聊天室，视频会议这些对实时通信有较大要求的应用使用websocket是最合适不过的 - 念及思久
7. websocket做IM，棋牌类游戏很合适  
不知道有没有人拿websocket做实时日志分析的  
我想做个用户染色，从入口开始追踪用户所有的api调用，参数，模块之类的  
[尴尬]还没做呢，线上的难调试，又没权限。出了问题好麻烦，想搞个实时日志 - 青衫隐_刘
8. 我采集用户行为数据没有使用websocket，二是先记录在本地，然后在下一个post 请求附带提交上去 - 水浸街
9. 很好。这个话题。现在的网页实施聊天基本用这个 - 如末
10. 我之前看的 用icomet 也可以实现即时聊天  长连接形式  - 陈阳
11. 使用场景：高实时推送，没啥好说的，我比较关心如何分布式部署[呲牙] - 沐旦
12. Websocket是面向连接的http，服务端可以知道客户端的实时状态 - Daniel
13. 要维持长连接[撇嘴] - 人生豪迈

#### 分享链接

1. 如何用消息系统避免分布式事务？ http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=211639194&idx=1&sn=bd732c82012f5dbd443c3fa56f49b65b - 黑夜路人
2. 我所理解的执行力 http://mp.weixin.qq.com/s?__biz=MjM5NTIyNTUyMQ==&mid=209463345&idx=1&sn=44a5fb5fdd127b69df87bf59657989f5 - 刘谦
3. LinkedIn副总裁：研发团队leader赖以生存的4点智慧 http://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=208755704&idx=1&sn=1e923c99c85e0af58d3d98b05a596866 - 黑夜路人
4. 如何学习Vim http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=214276591&idx=1&sn=eb8ee467474ba37f5482ef942b4b54c3 - 黑夜路人
5. 亿级用户下的新浪微博平台架构 http://mp.weixin.qq.com/s?__biz=MjM5NTg2NTU0Ng==&mid=210686623&idx=3&sn=d91b116ab094d6f22aea6a49c5aeff17 - 黑夜路人
6. 雪球在股市风暴下的高可用架构改造分享 | 首席架构师亲述应对30倍峰值历程 http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209562933&idx=1&sn=d9a09f7727d1bd83245f3d782359247e - 黑夜路人
7. 用消息队列和消息应用状态表来消除分布式事务 http://wangyuanzju.blog.163.com/blog/static/1302920086424341932/ - Huangsir
8. 搜狗高可用、高性能、可扩展商业平台设计 http://mp.weixin.qq.com/s?__biz=MzAxNTI4NDAzNA==&mid=207937619&idx=1&sn=7a1624f6a434c3881370a376b5fa9716 - 李水祥
