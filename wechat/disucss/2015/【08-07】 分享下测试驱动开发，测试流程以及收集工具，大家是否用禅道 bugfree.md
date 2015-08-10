> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=210316258&idx=1&sn=667c71dbb4dc6fbaf8ca1b4e25a03cb8&scene=1#rd>

#### 今日话题

分享下测试驱动开发，测试流程以及收集工具，大家是否用禅道 bugfree？

1. jira 需求和bug都放上面 - 鲁猛
2. 禅道。bugzila。bugfree。jira都用过。原来qihu用bugzila。现在team用禅道。没有感觉太大区别。只用于处理bug。 - 金亮
3. 我们之前用过worktitle、风车等 - 猿蜗
4. 我们用禅道 不过，新的项目直接用 git + worktile。对于小团队来说 禅道太重了，至于git托管，看自己了，自己搭也可以，三方服务也可以。 - @理鱼
5. 项目管理用的禅道，bugfree是测试人员用的 - Mutitty
6. bugfree好像就是禅道的前身？管理bug挺好的，也不仅仅是测试用，开发都用。用过一段时间的wss，感觉还不错 - Cesar
7. 小项目的话可以用mantis - 姚文强
8. 产品经理excel列出buglist  一天3次找开发review - 代号:红桃五
9. 项目经理+产品专员整理(合并和权重)，技术经理负责分析归纳，下发给执行的开发。
提高效率不建议开发工程师直接处理buglist - xingxing
10. 禅道还是不错的我们一直在用，这样测试不用时不时的过来找开发，开发定期去解决下buglist，这样开发起来更专心点，谁也不想一会一个人过来骚扰下你[呲牙] - dasn
11. 对，尤其是总打断开发是个很不好的习惯，并不是总去找开发效率就高，反而效率会地，还容易积怨导致离职。关键是最可怕的是，有些人过来找技术，并不是直接说明要干什么，而是过来讨论的……所以，就算我们这边是初创公司，也会把这种“问题”在萌芽期就争取尽量“杜绝”，所以产品经理＋项目经理是配套的，只不过同时会盯诸多产品线，服务线，功能线，的若干事情，确实他们也很辛苦……但为了解放技术人员和纯开发，有些“痛”还是需要做的。在现阶段我处理的方式是，流程和合理的方式，比具体工具重要，等发展到一定的规模及人数的时候，制度中会逐步的工具化。整体思路就是 工具 为 流程 服务，流程 为 合理的方式（协作） 服务， 制度更多的是为了企业文化来制定的。  - xingxing
12. 禅道装了，目前还没有推动起来，目前还是以tb为主 - 骑马爬树
13. 用过 禅道、tb、redmine、jira~  redmine还带wiki - sphenginx
14. 我用github issue ，通过标签和搜索可以满足大部分需求，issue可以和代码关联起来 也是很多工具没有的，和非技术的同事打交道 我就用印象笔记了 可以互相共享 - twin
15. 实话说现在开发都是先写代码再补测试case，木有测试驱动。有时候测试覆盖不了，是成本问题。上次写了个把 gbk 当做gb2312转到utf8的坑爹代码，结果大部分中文字符都跑通了。。 - 覃孟尧  
回: 这个是, 有时候写着觉得写出来的东西没保证,就先写测试再去补充逻辑了 - twin
16. 测试驱动开发没试过，只有核心部分会写高覆盖率的测试 - 沐旦
17. 测试驱动我之前用node做项目的时候用过，这种方式特别好，我想把这些方式移到php这边，但没找到一个有效的方法 - 猿蜗
18. 测试驱动只是开发方式,其实都是用phpunit 要更高级点的就用codeception - twin

#### 分享链接

1. Redis 双主实现 http://mp.weixin.qq.com/s?__biz=MzI0NzAxMTgxNg==&mid=207809626&idx=1&sn=deb5b89360e784d8f4bc755c3be33e2a - 猿蜗
2. 你知道腾讯互联网团队是如何组成的吗？ http://toutiao.com/a5211687381 - 猿蜗
3. 互联网DSP广告系统架构及关键技术解析 | 广告行业资深架构师亲述 http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209341887&idx=1&sn=a26c96bb4922e0ee653421aa73801e23 - 黑夜路人
4. MySQL中间件研究（Atlas，cobar，TDDL） http://mp.weixin.qq.com/s?__biz=MjM5NTg2NTU0Ng==&mid=210312359&idx=3&sn=8db7078649ed60c94ce74438db8f54ba - 黑夜路人
5. Container技术栈详解 http://mp.weixin.qq.com/s?__biz=MjM5ODM3MzkyNQ==&mid=219617168&idx=1&sn=95d9b589d755ab3f78057eb6c6a38d41 - 袁峰
6. 【直播全文记录】 从零开始搭建高可用IM系统 http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=206894493&idx=1&sn=69d09b82305aca8b1d1b5dfb308eb0b7 - phpzone
7. 解耦的艺术—大型互联网业务系统的插件化改造 | 高可用架构 http://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=209355872&idx=1&sn=508c515122896f59ba69262efea4ac2a - phperzone
8. Go 1.5 Release Notes https://tip.golang.org/doc/go1.5 - xingxing
9. 一致性 hash 和 Solr 千万级数据分布式搜索引擎中的应用 http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=211442049&idx=1&sn=54462d455d5d1584489e1f97b0c58871 - 黑夜路人
10. 一致性哈希算法的优化----关于如何保正在环中增加新节点时，命中率不受影响 http://scottina.iteye.com/blog/650380 - xingxing
11. 亿级用户下的新浪微博平台架构 http://mp.weixin.qq.com/s?__biz=MzAwNjMxMTA5Mw==&mid=212932878&idx=1&sn=4be8e2189e560329df4e3759feea77b3 - 黑夜路人
12. 这篇文章很赞：深入学习 Git 工作流 http://mp.weixin.qq.com/s?__biz=MjM5MzA0ODkyMA==&mid=210204561&idx=1&sn=a46bc1819fcef3e2d0caf71d0f1fbd2f - XiangZ
13. RESTful架构详解 http://mp.weixin.qq.com/s?__biz=MzAxNTI4NDAzNA==&mid=207581321&idx=1&sn=33f016b97b27d81a41f1b46422fc860d - DonxYu
14. MuleSoft开源用于设计RESTful APIs的工具RAML Tools http://www.infoq.com/cn/news/2013/11/raml-rest-api-tools - Lee.Li