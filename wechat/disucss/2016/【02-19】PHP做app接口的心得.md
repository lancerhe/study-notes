> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=402069727&idx=1&sn=24adafd99cc8e4e77cb84badb896607a&scene=23&srcid=0223tfL0tyShSkLUE19nbu31#rd>

#### 今日话题

PHP开发app接口心得

1. 在做app接口的返回值的数据类型时需要注意，弱语言和强语言的处理数据类型毕竟不同，比如空数组的返回至少要初始化一个，这样可以让一些客户端处理起来方便，而不会因为一些数据的不正常造成 crash，还有就是错误返回的标准统一周全，以及返回适当的错误提示  - 大胖

2. 文档要写周全，需要的每个字段，规定是什么类型，什么含义要标柱清楚，写完接口后自己先测试一下是否通过，不要直接扔给测试或者开发，然后反应错误了在进行修改 - 三千

3. 接口要小而多，不要做大而全，以方便减少服务器压力 - 三千

4. 当数据库里的字段发生变更后，要及时更新文档，并和使用到的程序员打个招呼，起码群里喊一声，否则当app发生报错崩溃后，背黑锅的一定是你，这条是经验之谈 - 三千

5. 当数据库里的字段发生变更后，要及时更新文档，并和使用到的程序员打个招呼，起码群里喊一声，否则当app发生报错崩溃后，背黑锅的一定是你，这条是经验之谈 - 大胖

6. 1，文档写周全，  
   2，接口的测试（如果是Node.Js / MongoDB 的搭配，也可以弄个自动化测试），测试要包含所有的返回情况，  
   3，接口的规范，可以遵循 REST full API   -蜗牛

7. 还有个需要注意的，可能是 content-type ，返回的是 json 数据，最好就是 application/json ，客户端一般都会用第三方的网络请求组件，而一些组件对 content-type 有严格的限制，当然这个需要和客户端的程序员确认，避免你明明返回 json 在 text 下可以正常显示，客户端却无法解析出来     -大胖

8. 我们的接口一般是给app用的， 接口要加密。每次回话前 都向服务器请求token，服务器以session存储，回话结束，就销毁。 - windk

9. 说到给app，我在插一句，接口不仅仅是给app用的，以后新的设备会很多，可能智能手表，智能沙发，智能书包等等，所以早做接口早省心 - 三千

10. 说到接口，今天遇到一个微信的坑。调用一个接口，数据要求是JSON格式的，那一般是数组进行JSON序列化得到的，中文数据就会被编码了，然后，微信那边直接使用编码后的数据，没有解码成中文，有个字段对于内容有限制，然后就一直报我的数据有问题，搞得我得手拼JSON字符串了。 - 李三

11. 你肯定不知道json_encode第二个参数JSON_UNESCAPED_UNICODE，不过是PHP5.4以上版本才有，低版本那可以先urlencode 然后 json_encode 然后 urldeocde-光阴的故事

12. 用restful，最好开启https，不然会被坑死的，运营商，浏览器，路由器一般发现4XX，5XX状态，喜欢替换成自己的广告，如果不用restful，返回的都是200状态，就不会被替换成运营商或路由器自己的导航页了，运营商，路由器容易擅自根据403，404状态推自己的导航页　－tiyee

13. 问一个问题。如果服务端采取了防重放机制，要求http请求带上时间戳，和服务器的时间误差超过一段距离则请求不合法。那么，客户端的时间戳不一定是正确的（有可能用户改了系统时间），这种方案该怎么调整？－阿哲  
第一次启动从服务器获取一次时间，之后客户端自动计数维护这个时间，每秒加一，这样就跟服务器时间一致了　－Pelle  
答：应该是需要时间戳的请求。带上服务器的时间戳。比如说修改个人资料。是请求个人资料。客户端修改。发送修改后的个人资料。在请求个人资料的时候服务器就带上时间戳。最好是上面所说的token。我们可以验证这个时间戳。发送的时候带上这个时间戳或者token　－熊mao

14. 先定api 再开工－lawlielt  
关于版本：  
一个版本一个接口，旧接口要一直保留 - 大胖  
问：接口版本一般怎样区分？  
答：aa.com/v1/api1 我们一般目录 - 大胖  
做app的接口，必须要考虑所有版本的APP 都能正常使用接口 -蜗牛  
问：同一个接口对ios和android处理不一样，怎么解决 - Ericsuo  
答：请求的时候带参数区分 - 张礼  
答：一般在header头里面会带参数 - 光阴的故事  
答：接口直接都带个type区分就完了 - 淘小淘  
关于session：  
问：APP登录没有了网页的session，怎么处理的?  
答：jwt oauth - slee  
答： app一般通过token来进行登录验证 - 三千  
答：就是登录返回APP一个token，保存在客户端，下次传递这个token来验证身份 - 梦想旅程_北京  
问：一次请求算一个会话？还是token是有时效的 - yongsean  
答：token是有时效的，可以去更新-蜗牛  
答：token 不保存到客户端本地。 - windk  
问：每次请求前必须过去一次？ - yongsean  
答：对，时效时间内，多次请求 可以只取一次 - windk  
答：token这个属于安全性的东西 取决于信息的重要性 通常来说安全性要求越高,所要做的活就越，我们大致换了经历过三种方面：第一种 直接在 header里传用户名 密码 最简单,但最不安全。第二种 就在客户端种cookie 这个跟web一样了。第三种 就是用token 用一定的规则生成token 客户端每次请求带token 服务端用同一规则生成token 把token有效时间 放到token加密规则里 省得再验证一个时间戳

#### 分享链接

1. 远程接口设计经验分享 ：http://mp.weixin.qq.com/s?__biz=MzAwNjQwNzU2NQ==&mid=402064901&idx=2&sn=0b5f56a97b431ed355b75a9e17f2e754&scene=1&srcid=02192eUFKNkAmEEmoCbmol8o - @轻裘长剑 ‍來自火星
选大公司还是小公司 http://mp.weixin.qq.com/s?__biz=MzA5MTE0MDUxMA==&mid=419603421&idx=1&sn=3de11659477bdd4fd6097162a45a8071&scene=1&srcid=0219ryWsGm19snXOhDt6vRpi#wechat_redirect - 蜗牛

2. 怎样沟通升职快？http://mp.weixin.qq.com/s?__biz=MjM5NDE1MDU0MA==&mid=410906454&idx=1&sn=750f12570578213156a2c87b53fbd1d3&scene=1&srcid=0219sTxsLd9qTZYZCRD8RV27#wechat_redirect - 骑行西藏

3. json_encode中文unicode的问题http://m.haosou.com/index.php?a=newTranscode&u=http%3A%2F%2Fwww.th7.cn%2FProgram%2Fphp%2F201506%2F482376.shtml&m=a8429c606917316c7b4ce62cb4d8f10fe4982399&q=json%20encode%E7%AC%AC%E4%BA%8C%E4%B8%AA%E5%8F%82%E6%95%B0&sid=6a9ce8d7a1018f5be43b699c0e124004 - 崔洪波

4. MySQL 在大型网站的应用架构演变http://mp.weixin.qq.com/s?__biz=MzA5ODM5MDU3MA==&mid=402228394&idx=1&sn=2177f4ca396c655054ab9b8c99b7a0a6&scene=1&srcid=0219vS46zgKaqiljNzw83Vlk#wechat_redirect - 蜗牛

5. 京东数据驱动下的个性化推荐（附PPT）http://mp.weixin.qq.com/s?__biz=MjM5MDE0Mjc4MA==&mid=402831658&idx=1&sn=099ea0a449fd084fbd119b6d870191ec&scene=0#wechat_redirect 雷澍

6. 下厨房数据丢失事故回顾与总结http://os.51cto.com/art/201307/402038.htm-黑夜路人

7. 浅谈 PHP 与手机 APP 开发，以前转的一偏文章，自己又改了一些东西，http://www.itlipeng.cn/?p=707 蜗牛

8. 优秀API设计的十大原则http://www.itlipeng.cn/?p=715 蜗牛　

9. What is the best way of session management in REST architecture? https://www.quora.com/What-is-the-best-way-of-session-management-in-REST-architecture tiyee
