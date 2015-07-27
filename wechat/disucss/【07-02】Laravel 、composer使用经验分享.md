> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=209510277&idx=1&sn=64b66ee572ff13b6bca006b732ac040f&scene=1#rd>

【今日话题】
Laravel 、composer使用经验分享 - 猿蜗

1. 5.1就是lts  composer真是挺好的，只是国内因为墙的原因还没火起来
也可以自己搭建一个，有现成的开源 - 轩脉刃

2. composer最大意义就是php不同项目也可以协作了，不用再拷贝代码了。我最近还从composer上找了个curl的封装，比我自己写的好多了 - lalala

3. 虽然国内有人搭建了 镜像 但是不是很稳定 - @理鱼

4. 嗯 有个日本镜像还好吧
镜像网站：
http://pkg.phpcomposer.com/
https://toran.reimu.io/
http://packagist.cn/
http://pkg.uselaravel.com/
http://comproxy.cn/
日本的：http://composer-proxy.jp/
- 黄恒华

5. 嗯，可以自己弄个packagist私服，不过就是那个用户体系不大好二次开发啊，没用过symfony。 - lalala

6. composer可以搭建私有的镜像
laravel artisan tinker 这个可以打开一个repl ，直接在命令行与laravel 交互
packagist上有一个laravel-debugbar的包安装好以后调试比较方便 - 姚文强

7. 问: 和 laravel 交互之后能做什么 相对于在命令行运行 laravel 吗 - 菜包子

回: 用于 数据测试 tinker 很方便 这个也是从 rails 里面借鉴来的 - 黄恒华

8. 问: laravel 大家有用到生产环境吗 - 姚文强

回: 有啊
BTV大媒体  后端
14年1月上线的
bbm.brtn.cn
不过现在已经是别人在接手了 - 安正超

9. 问: laravel性能如何？ - 膘叔

回: @膘叔  框架性能真不是你需要首先关注的 性能在框架中中等 - @理鱼

回: 当然要关注，业务逻辑什么的，其他框架也都能实现。当这些问题都不大后，就剩性能了
不过，还有一个就是文档和易上手的程度，
要说项目、逻辑的解耦啥的这些都还好办，是个框架基本上都能解决。文档健全、容易上手，才是相对关注的 - 膘叔

10. laravel 虽然不是php框架里面性能最高的。但个人感觉是用的最爽的
它的生态系统做的非常好
包括文档，社区，视频，云服务，工作机会等 - 姚文强

11. laravel 有高清的英文视频~
但中文视频嘛~~，自己慢慢找把~ - 猿蜗

回: 对，这点真心赞，laracasts - 姚文强

12. 单个模块实现还是不错的, 功能齐全也不复杂,也不断加入新功能
整体mvc用了symfony太多功能模块,性能中等,实现较复杂.
功能耦合稍大,象各种全局函数,第三方类库sf, Carbon, interface, 用得比较多
Facche模式实现的静态调用是最大亮点, 这个也是写得爽的原因, 但没有代码补全, 是一个遗憾 - twin

回: 代码补全?你用啥?php storm?laravel ide helper 有试过吗 - 姚文强

回:  有这个方便多 - twin

13. 问: laravel 和yii2 相比呢 有没有特别压倒性的优势 因为只是听说 没怎么用过 特别喜欢听什么 完爆之类的劲爆词汇 - 蚂蚁

回: yii上手慢一点。 前段时间 朋友要用yii做个东西。我看了看。设计理念好，但但要求对框架的了解度高 - A.伊磊

回: 是的 前阵子 换yii2 虽然觉得好用 但是有些yii2自定义的一些输出也好 验证也好 还的仔细看看有些甚至文档里面也一带而过 需要看看源码 - 蚂蚁

回: yii2 yii都写过一整子 有些时候会觉得laravel比yii2方便 - 指尖上的艺术家

14. 之前 用composer 的时候用了一个图片处理宝 应该是开发版的 结果前阵不小心更新项目的依赖 包直接没了 没仔细看是remove 还是rename了 搞得现在不好更新了
现在都需要新包直接命令行require 执行一下 - 蚂蚁

15. 希望说说 php artisan migrate 部分.  这方面没接触过.
目前我们开发都是用的内网 统一的一个mysql来做, 做了表结构调整后大家都可以用.
laravel 的表结构生成器  和 数据库迁移工具挺有意思
线上的咋搞. 比如线上的mysql  加索引 加字段
我目前是通过 mysql的  时间 at到 凌晨业务低谷去做  这些操作
- @理鱼

回: 基本上是和ruby一样吧 - Max

回: 还可以rollback 和 seed
这个只是开发的时候用的
如果你在生产环境上使用的话它会提示你的 - 姚文强

16. rails 有个好处 就是直接生产最后的schema 文件 ，这个 laravel 我还没发现有这个特性 - 黄恒华

回: mysqldump - 姚文强

回: symfony早就有了 - 星海

17. Yii2 完爆所有 php 框架
实在想不出用其他框架的理由
Yii2 的 app , module, 版本化，过滤器，验证，composer , rbac 都是深思熟率做出来的
用的好项目多人开发几年也不会烂摊子
Lavavel  包了一个 symfont, 速度还慢， action 还要一个一个注册，路由必须 restful  不觉有什么好
 说完了 - 菜包子

18. 问: lumen 用了么 - 黄恒华

回: 要做接口的话lumen才对 - 青衫隐_刘

回: 做接口，slim也可以考虑 - manatee

19. 这2个国内普及度极低
基本都是小创业公司一些新的社区再用
但是很有必要学习一下。composer堪比npm，laravel就是一把瑞士军刀。 - 如末

20. 感觉这些玩意把php搞复杂了 - lwPan

21. laravel做做企业站，博客挺方便的 - tiyee

22. 不不不，这是一个趋势。一个代码语言，必须得有一个包管理工具。
其他语言基本都有。nodejs 的npm为啥大家都用的很爽。
yii,ci,tp做企业主博客也方便。用la 主要是形式新颖，用起来很爽
- 如末

23. composer用过，是很方便，但框架有时改着改着，就私有化了，慢慢新人入职，接手项目的时候就是和外面不太一样的框架，这时就不太会再次使用composer了 - 骑马爬树

24. Npm对应的是pear不是conposer
其他语言，有一些公共库，但php没有，spl内容太少
一个php项目，很多库都是自己写的，成不了标准库，所以composer地位尴尬了，laravel用的sf的库，所以composer对它还有点用处
一直以来，php官方都在优化性能，增加特性，但是对公共库不热情，spl这么多年了，还是半死不活的
当然，php本身就比较野，一开始没有引入包和命名空间，函数没有归类，所以造成了现在的混乱 - tiyee

25. php的公共库大部分是以扩展的方式存在的，laravel语言层面性能很渣 - lwPan

26. laravel是一个很不错的框架，个人感觉比tp,ci扩展性好一点，composer这个工具也不错，不仅能解决依赖关系，还能生成自动加载列表，方便很多
laravel还推动了PHP高版本的使用
phalcon和yaf都是高性能框架，也很优秀 - 布罗塔

27. 最重要的是  composer self-update  不然实在太慢 - 阿牛哥

回: 换个国内源 - 如末

28. 我以前就用的la mac composer翻墙用

29. mac上我用Homestead 开发laravel - 俊杰sang💯

30. Laravel Homestead http://v4.golaravel.com/docs/4.2/homestead - 如末

【分享链接】

1. 使用 Ansible 管理 MySQL 复制 http://mp.weixin.qq.com/s?__biz=MzAwNjMxNjQzNA==&mid=207322818&idx=1&sn=046a9fed3da3d86474e2f09488d62dc2 - 黑夜路人

2. 普通运维人员就是秋后的蚂蚱！ http://mp.weixin.qq.com/s?__biz=MzAwMDM2NzUxMg==&mid=2678831183&idx=1&sn=00f54ab69908813cc3d1beb6917c9287 - 猿蜗

3. 《视频: IP归属地数据库的那些事儿 —— 高春辉》
http://v.youku.com/v_show/id_XNzcyMjEwOTAw.html

《IP 库的那些事儿之 2013 - 2014 流水帐版》
https://www.evernote.com/shard/s1/sh/ecaa734a-f53f-4b92-a65b-f4b5be7cb8f3/931d01e038fdd256 - XiangZ

