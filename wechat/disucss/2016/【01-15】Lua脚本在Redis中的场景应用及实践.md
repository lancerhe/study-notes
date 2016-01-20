> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=401703582&amp;idx=1&amp;sn=ec97dd9e9c9d73e69f1636d852e51042&amp;scene=1&amp;srcid=0116EDgZqa0pDWFdGRW9pG8U#rd>

#### 今日话题

Lua脚本在Redis中的场景应用及实践 - eric huang

1. 用過ngx-lua的 lua- resty- redis 也用過Redis原生支持的Lua，都很好用，Redis原生的Lua支持，要注意Redis是single thread， Lua邏輯不要太複雜，否則會阻塞，OpenResty的lua- resty- redis要注意pool取出來的conn 用完一定要放回去 - Pahud
2. 一些很簡單的操作邏輯可以寫成Lua，傳上去Redis裡面，客戶端就可以傳參數過去觸發，有點像stored procedure，如此客戶端不用管業務邏輯，只要傳參數進去即可，例如更新一個key之後做簡單的判斷再更新另外一個key，因為是single thread阻塞操作，理論上某種程度可以確保一定的原子性，有點像是invoke function的感覺，只是這個func是Lua寫好預載進入redis的 - Pahud
3. 项目组曾简单用lua在redis中做统计。 - 北北
4. 之前在做分布式事务中，用了lua脚本，主要还是多个操作的原子性（redis不存在严格意义上的原子性，因为不支持回滚）。比如，在一个逻辑中，你要操作多次redis，但是由于网络交互的不确定性，你又不能忍受中间有一步出问题，这种情况就可以用 - 廖强
5. 一些高IO场景用lua嵌入到nginx中，提供对外接口，性能可观 - 阿芳
6. 运维这边可以弄个lua 脚本嵌入到 nginx 中可以看到 nginx 的 qps，对 qps 进行监控 - 宋明明
7. lua目前用到的就是弥补redis的原子性问题 - 周志
8. 用lua来进行客户端接口重构、可以节省不少资源 - Geoffrey
9. NGINX 负载均衡策略之「快者优先」的 Lua 实现 http://blog.jamespan.me/2015/11/27/fastest-first-load-balancer-for-nginx-with-lua/  - 踏雪无痕

#### 分享链接

1. 如何使用HTTPS防止流量劫持 https://mp.weixin.qq.com/s?__biz=MzAwMDU1MTE1OQ==&mid=403543371&idx=1&sn=09226c7add18c9c8299fef012fc55565 - shawnvan
2. 从0到1：微信后台系统的演进之路 https://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=402340325&idx=1&sn=5b7bf6025b1a83a0e529e630fc95ae28 - hyp
3. 明天就要参加公司成立1年多以来的第一次团建了，坐在宽敞明亮的办公室里，深感幸福来之不易，心绪久久不能平静。花了很多时间回顾过去，展望未来，于是有了这篇《我们用多一点点的辛苦，来交换多一点点的幸福——我的2015年终总结》http://weibo.com/3414827754/Ddhu8ahLB?from=page_1005053414827754_profile&wvr=6&mod=weibotime&type=comment - 大名狗剩
