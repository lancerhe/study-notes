> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=204378982&idx=1&sn=0228d08448c4a78be0043cbfcd1c9291&scene=1#rd>

1. 升级过程中会有些“过时”函数提示 - 人生豪迈

2. 还会有不兼容的函数，我做过一次php小版本的升级，由于一些函数json_encode使用太广，最终修改源码来解决的 - 廖强

3. 5.3最明显的就是命名空间了。tp3.2,yii啥的还有不少开源程序使用命名空间必须用至少5.3了。 - 海浪

4. 可以先拿业务主线测试下5.2跟5.6的性能差异，成本也不大，看数据再决定是否升 - now

5. 语法上的小差异导致的问题通过线上导流量对比测试，上线前导量跑段时间，应该大部分的问题都会出来 - now

6. 5.3 + apc ，有时候进程来不及关闭，会造成死锁现象， 造成响应会很慢 - Meow

问: @Meow 这种死锁的情况应该怎么处理呢? 是程序问题还是扩展问题呢 - twin

回: 是扩展的问题吧，我记得是阿里的人写过一个分析，可以搜一下
http://www.searchtb.com/2014/02/apc-lock-php-fpm.html - 风之缘

7. 从 PHP 5.2.x 移植到 PHP 5.3.x http://php.net/manual/zh/migration53.php - now

8. 升级最大的好处应该是性能的提升,如果性能本身不是瓶颈,也用不到新版本的新功能.升级并不是什么好事情 - shawnvan

9. 我了解数个公司升级后遇到各种问题
大部分升级是为了潮流
大势所趋的感觉
另外，是用的第三方开源库，需要依赖比如命名空间之类的 - 黑夜路人

10. 其实这个问题，我觉得不可能一致性的，比较有效的方式，开一台备机，做tcpcopy，观察各类日志。。。
一般遇到的问题，基本上都能反应
而不是一下子就把所有都改好，然后升级环境
基本上流程是流量拷贝、bugfix、灰度升级发布 - 学在囧途

11. 恩，主动升级一般是性能提升和新特性的使用，被动一般就是依赖的需求。 - 达达

12. 升级基本上是有性能方面考虑，然后我觉得两个版本最大的区别还是命名空间。魔术方法还好 - yongsean

13. 升级有一个目的是为了用第三方的SDK，对方用的都是5.4，自己用以前的版本根本无法使用 - 新坤

14. 一般项目半年最多一年都有一次重构机会,升级一般会放在这个过程里面,一方面能提升性能,另一方面可以把赶进度过程中产生的"垃圾"代码改改好,不会为了升级活着尝鲜升级 - shawnvan

15. 老项目一般都不让升级，特别是线上稳定的版本 - Ericsuo

16. 如果规模不大 一般如果官方升级 出建议升级的文档 都会升级 尤其是有些bug修复 - 蚂蚁

17. 我们升级5.3的时候，印象最深的就是 ereg 替换 preg， 然后修复了一些warning。小项目，没考虑太多，直接升了 - 廿九

18. 5 .2升至5.5还是相当麻烦. 建议升至那个版本前还是好好看看手册
我们之前升级都是域名切换，就是需要线上另配一套实现无缝切换，不知道还有没有其他办法实现无缝切换 - tywei

19. 域名切换的话,那收藏的地址就无效了?  应该是确认无误后,逐步把机器跟域名解绑,升级后再加回去
或者你在机器上装个新版本,两个版本在各自目录下,互不影响,fpm重开,nginx reload下,也是很快. - twin

20. 我们从5.2升级到5.4过，直接先在一个机房搞新机器部署，然后接到lvs上，在线上流量下观察效果。线上5.2和5.4并存，最后确认可以，再把5.2的机器从lvs上摘掉，下线。 - 付坤

21. 写个配置，启动不同的fpm，这个思路也好。就是扩展等需要重新编译 - 黑夜路人

22. php从5.2升级到5.4遇到的问题

1.curl方法的curl_setopt:
undefined CURLOPT_CONNECTTIMEOUT_MS

需要自定义一些常量。
 if(!defined('CURLOPT_CONNECTTIMEOUT_MS')){
     define('CURLOPT_CONNECTTIMEOUT_MS',156);
 }
 if(!defined('CURLOPT_TIMEOUT_MS')){
     define('CURLOPT_TIMEOUT_MS',155);
 }

2. 5.4自带SessionHandler方法
由于5.4自带SessionHandler方法，导致在使用SessionHandler时未触发autoload，未加载自己定义的handle类

3. 5.4 Fatal error: Call-time pass-by-reference has been removed
5.4中，函数定义时使用引用，在调用时不再使用引用的方式，否则会fatal.
$Z->getGroupDataByCidTid($cid, $tid, $sn, $pn, $channel,true,&$filter_arr);  //这是使用时不应该传引用。

4. 修改php-fpm设置security.limit_extensions
默认值为 ;security.limit_extensions = .php .php3 .php4 .php5
如果有.json后缀的文件需要用php解析。需要修改为：
security.limit_extensions = .php .php3 .php4 .php5 .json - 付坤

【分享链接】
1. Kafka深度解析 http://www.jasongj.com/2015/01/02/Kafka%E6%B7%B1%E5%BA%A6%E8%A7%A3%E6%9E%90/ - 念念念恩他爹