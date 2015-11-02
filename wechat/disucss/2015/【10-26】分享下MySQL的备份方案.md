> 转载自：<http://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&amp;mid=400159537&amp;idx=1&amp;sn=8e2d239552d60072d6bff5d8b2b7444b&amp;scene=1&amp;srcid=1027FRYZfa5TaKIoRkcn6Pmr#rd>

#### 今日话题

分享下MySQL的备份方案

1. 两个前提：1. 备份任务集中管理，基于WEB平台定备份任务 2. 备份结果要有Report及每天的随机抽样恢复  
随机恢复是对备份有效性及平台的工作正确性的一个校验，这些都是写好的程序每天自动跑就行了，也是对那个平台的考验，再说一下备份存储这块需要注意的坑：1. 一般是先是Disk2Disk 为了加速备份，一般不压缩。 也为了减少备份对机器性能的影响；2. 备份传输，需要控制带宽，别让把内网跑满，特别如果做跨IDC存储时，要特别小心，别影响业务；3. 在备份恢复设计中需要注意占用时间，这个影响到紧急恢复或是利用备份建从库，能做到心里有数  
====================  
在说一下备份的东西：  
建议全备+binlog ，不要使用xtrabackup的增备（没办法做到基于time point 恢复）  
对于上T的大库，建议利用从库做备份，同时备份工具使用停从库+Rsync做差异获取全最备份。  
注意目录命名，需要能一眼看现来是那个业务，那个端口，什么时间的备份（方便恢复及获取配置）  
================  
差不多就这样了。 也请各位大牛补充  
这边存储存备份，用了一个hdfs ,另一块就是原生的磁盘。 那种一台机器能装20块SATA盘，差不多每台机器容易在20T以上的。  
现在便重于原生机器直接用。  
HDFS也是网络的问题。  
- 吴炳锡@专业MySQL培训
2. 从库来做备份[呲牙]，我也是这样设计的，shell什么的都写好了。就是没用，还有，你们是用什么命令备份的@吴炳锡 - 胜邪  
回: 一般是调用innobackupex做备份 - 吴炳锡@专业MySQL培训  
回: [呲牙]我比较土，直接用的MySQL dump - 胜邪
3. 问: 大家一般用什么工具替代crontab  做定时任务 - HarveyZ  
回: 没替代，就是用cron - 胜邪
4. 我采用最原始的，定时导出sql - 果冻
5. 主从备份，定期全库MySQLdump binlog备份 - 如末
6. 应该定期全库+时刻增量 + Yangjing
7. 一般都是主从吧 每次重要操作前全量dump出来一份备份 - 黎博
8. 上周被阿里云rds坑了，刚用xtrabackup迁移了数据 直接sql转存，导入老报错，只能用xtrabackup - tiyee
9. 数据迁移，看引擎，mysiam可以直接移文件，innodb可以根据binlog来，数据不大且简单，直接转存SQL，商业数据库好像都有成熟的备份工具 - tiyee
10. 土方法 主从复制(可以多层分发 m-m-s) 每隔一个时间点 整库备份(myisam) - lawlielt
11. 备份与容灾的清新解释 http://mp.weixin.qq.com/s?__biz=MjM5MjIyMzU1MA==&mid=548132336&idx=1&sn=c44c54ae25a4243abbd25947d16fcef3 - 乔楚
12. 然而，现实中的产品经理并没有什么卵用！ http://mp.weixin.qq.com/s?__biz=MzAwNjcyMjExOQ==&mid=400156111&idx=1&sn=153de2c887accc7c30adcf260255bd45 - UCDmao
13. 问个问题， 你们oracle与MySQL以及MSSQL相互迁移是怎么弄的？ 有啥好用的工具么 - 有色素的果冻  
回: 用kettle的比较多 我知道的是  平安的数据部门是用的kettle - lwPan  
回: 对oracle不熟，刚另外一群推荐了， Navicat Premium - 有色素的果冻  
回: 不好用。对oracle支持不好。用spoon试试。 - 薛定鄂的猫

#### 分享链接

1. 架构师大会上的分享的《CDN云端安防平台实录》 http://m.weibo.cn/2278606921/3902150008402564/weixin - 钱志强
2. MySQL 5.7 GA 版本发布，原生 JSON 类型支持 http://www.oschina.net/news/67236/mysql-5-7-ga?t=1445523813379 - 猿蜗
3. 架构师必知：提升网站性能开发的10个技巧 http://mp.weixin.qq.com/s?__biz=MzAwNjMxNjQzNA==&mid=400074334&idx=1&sn=056d10a7a5bab718bbe376a8f0f67820 - 若凡
4. 别学东学西了，先建立自己的知识体系吧 http://mp.weixin.qq.com/s?__biz=MzA4Nzg5Nzc5OA==&mid=400103116&idx=1&sn=89bc2f3644603ffcf5f2c517172141ba - @理鱼
5. 链路劫持攻击一二三 http://security.tencent.com/index.php/blog/msg/10 - Xiangz
6. PHP高级编程之守护进程，实现优雅重启 http://m.oschina.net/blog/519156 - 黑夜路人
7. 阿里容器（Docker）服务实践之路 https://mp.weixin.qq.com/s?__biz=MzA5OTAyNzQ2OA==&mid=400078708&idx=1&sn=e2a6ccb2fd82246c865467a32544ec0e - 猿蜗
8. 融合web开发技术的同构原生app基础架构 http://www.infoq.com/cn/presentations/the-isomorphic-native-app-infrastructure-of-web-development-technology - 黄隆