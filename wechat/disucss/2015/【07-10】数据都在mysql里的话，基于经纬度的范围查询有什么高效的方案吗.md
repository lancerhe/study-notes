> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=209808275&idx=1&sn=8ed6174090bad97838523e3de726de8a&scene=1#rd>

【今日话题】
数据都在mysql里的话，基于经纬度的范围查询有什么高效的方案吗 - yingang

1. 经纬度搜索(1)-Geohash算法原理 http://hankesi2000.iteye.com/blog/1344914 - 学在囧途

2. 之前是存mysql,然后用了一个计算球面两点距离的公式算的，后来改为es查了 - 姚文强

3. 看具体要求，如果是类似“附近的人”这样的业务最合适是用geohash ，先过滤掉绝大部分数据，然后使用代码计算查询结果的每项数据与当前位置的距离 - 水浸街

4. http://redis.io/commands#geo
最新版的redis官方版支持geo啦 - 种树人

5. 昨天刚遇到。。。如果限定条数其实还好。用geohash先画个范围，然后再sin/cos那种方案。麻烦的是取全库排序。。
lat/lng，网上说用rtree索引效率更好 - 膘叔

6. redis的geo翻页支持差，返回全部item，这样太浪费了 - 虎之

7. GeoHash是一种降维方式
因为常见的B树索引是对索引字段进行排序，然后通过类似二分法查找的方法进行快速查找，二维的地理坐标要怎么排序？
所以就把二维的地理坐标生成一维的字符串，方便排序和索引。
具体的可以参考《GeoHash核心原理解析》
http://www.cnblogs.com/LBSer/p/3310455.html - XiangZ

8. mongodb好像也是通过geohash来做的，solr应该也是
还有sphinx也支持，redis也有一些工具来做
http://blog.nosqlfan.com/html/1811.html

比较好的方案还是 postgresql + postgis - XiangZ

9. 图解 MongoDB 地理位置索引的实现原理 http://blog.nosqlfan.com/html/1811.html - XiangZ

10. 这种基本上只能把数据往postgresql里面导，建R树索引 - 廖强

11. mysql不是也可以了吗？新版的
或者有种方式是把数据都load近内存 - H uangsir

12. mysql的实在低效，可以导mongodb，redis也新增了个geo模块 - 湛之

13. 不是哇，我觉得posgre和mongo都不如mysql
尤其mongo的client有2w链接上线的硬编码，好长一段时间被他伤的很深 - H uangsir

14. 一年前实测mysql geo 索引效率远低于mongodb，基本不可用于实时查询
而且mongodb支持多边形等多种范围查询 - 湛之

回: 一年前有这东西么？自己装的扩展吧？ - H uangsir

回: 有啊
只是基本不可用
现在最新版本没用过 - 湛之

15. 可以考虑试一下Redis的geo模块
mysql可以作为数据备份，实时查询还是算了 - 海中金

16. mongo要是涉及到多表查询，或者分页就很蛋疼。
所以只能把超多字段往一条记录塞。当然这也是mongo的一个优势。 - 如末

17. mongodb太多坑，可能是我之前用得不好，如果对mongodb用得很好的，并且支持R树索引的，也没问题
不建议用redis吧，全内存的太贵了。。。。而且不知道这个geo模块有没有什么坑，内存碎片什么的 - 廖强

18. geo的查询可以化为基数数索引，你把整棵树保存到硬盘里 当然要自己写 - H uangsir

【分享链接】

1. 高并发系统中的常见问题 http://weibo.com/p/1001603862417250608209 - ning

2. Python 中的进程、线程、协程、同步、异步、回调 http://python.jobbole.com/81692/ - xingxing

3. python多线程机制 http://blog.163.com/sukerl@126/blog/static/112027649200962792420389/ - 凹凸曼

4. Go GC: Solving the Latency Problem in Go 1.5 https://sourcegraph.com/blog/live/gophercon2015/123574706480 - 黑夜路人

5. Linux全局代理 http://blog.csdn.net/decken_h/article/details/45306391 - @理鱼

6. OpenSSL的新bug https://www.openssl.org/news/secadv_20150709.txt - 黑夜路人

7. Go 1.5 Beta1 发布，完全使用 Go 编写的 Go http://m.oschina.net/news/64051/go-1-5-beta1 - 黑夜路人
