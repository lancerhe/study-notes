> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=401081413&amp;idx=1&amp;sn=4de7744021bb73a66f4c864db8eb154a&amp;scene=1&amp;srcid=1204874qf8YEeXbrVMUJHvVn#rd>

#### 今日话题

讨论下redis的漏洞问题及Redis使用过程中的安全防护措施 - eric huang

1. redis crackit安全事件预警 http://m.weibo.cn/mblogwx?uid=5705824788&id=D3kEEwlH4，redis上次吃过亏了。经群里提醒，主要是加防火墙，登录密码，禁用命令。 - 曾杰
2. 我在测试3.2 感觉geo功能还不够稳定 - 雷澍
3. 密码和命令禁用还是要的 防不明情况的人误操作也行[呲牙] - xiayf
4. Redis 绑定IP，用户名密码，防火墙白名单。不知道还有其他防护措施嘛。 - 邵奇
5. 一般会有多台机子访问Redis，绑定IP可行吗？ - eric huang
6. 最好把redis 部署到内网IP。。同时requirepass - Charles Tseng
7. 现在都是部署在内网的吧 不要用root账户启动redis - 如末
8. 走内网或者走代理，我记得改绑定ip要重启的，这个不能接受 - tiyee
9. 问: 不需要重启吧？，加密码也不需要重启 - 如末  
回: 不用重启。我记得config命令可以实时生效的。 - 北北  
回: Config只能改部分配置，记得是这样 - tiyee  
回: 通过config get * 命令可以查到在不重启服务的情况下可以修改的参数。 - 北北
10. 1.用nologin用户启动redis  
2.redis监听端口，改为ip，例如 *:6379改为192.168.1.1:6379  
3.换redis端口 - 林志勇
11. 密码，内网访问，运行权限，不使用root - 斯图尔特
12. Redis安全漏洞通报 https://mp.weixin.qq.com/s?__biz=MzA5MzAzOTIwNQ==&mid=400949539&idx=1&sn=65f51aa65aeda24ad921c43f7536fe7f - 杨春勇

#### 分享链接

1. 这 9 个关键字，妹子和你聊聊 2015 年的大数据 https://mp.weixin.qq.com/s?__biz=MjM5NjQ4MjYwMQ==&mid=401092467&idx=1&sn=4de3c10671d2dd706f115e1aec8d4f25 - 如末