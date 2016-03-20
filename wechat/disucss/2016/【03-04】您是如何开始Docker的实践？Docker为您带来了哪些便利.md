> 转载自：<https://mp.weixin.qq.com/s?__biz=MzA3MDA2MjE2OQ==&mid=402214850&idx=1&sn=5dd6bb6e53d0b15f8dd87cea94a3075b&scene=1&srcid=0308Rm91wqhWY6Hgh8t52cRF#rd>

#### 今日话题

您是如何开始Docker的实践？Docker为您带来了哪些便利

1. 还是在了解Go语言之后才知道的Docker，还没实际用过不过小项目这个不建议使用吧-刺客

2. 可以学习下用用。每次换个环境都需要重装，用了docker，带几个dockerfile文件就行了-斯图尔特

3. 用docker 有时删除的时候会出现 <none> 在 mac 上用docker 也挺好 我现在本机就是用的 docker -蜗牛

4. 感觉mac上面用docker有点坑 ，入门时两眼一抹黑-简单

5. 开发，测试，集成，线上的环境一致。部署快。 - 斯图尔特

6. 开发的时候部署一个服务比较方便，还能方便的搭个虚拟机。 - 菜包子

7. Docker大规模应用前，应用和服务的分层～数据，状态与逻辑的分离～业务的清晰边界～等等都很重要～  
在自动化和持续交付上面也有很大优势  
对Ops和DevOps团队更便捷～资源利用率也能提高～变相节约成本～  
对有些开发不愿意去了解环境也有所缓解  
但对环境要求苛刻，定制或特殊业务上帮助有限～  
销毁和重建的成本低～便于快速调节资源～在非云端及弹性扩展不便利的情况下，可以更快的做部署和调整～ - xingxing

8. 提高物理机的资源使用率 - 我不叫大脸猫

9. 我们原先基于 kvm 那套上线流程已经比较完善了，迁移 docker 的流程成本太高了，暂时只能把它弄成一个 Iaas 的载体在用，用处主要还是能虚更多的机子了
变相带来的好处是测试申请机子更容易了，团队更和谐了 - yangmls


#### 分享链接

1. 某Docker入门教程：http://mp.weixin.qq.com/s?__biz=MzA5OTAyNzQ2OA==&mid=401816155&idx=1&sn=a7543ef15cda28c13e28a9e54ef631a8&scene=1&srcid=0304i4kpmUBOvN1giMnn1t4t#rd
http://pan.baidu.com/s/1pKdbBb9  -三千

2. 在Docker中运行PHP项目的探索之旅：http://mp.weixin.qq.com/s?__biz=MzA5OTAyNzQ2OA==&mid=401733917&idx=1&sn=19f09a54cf62356a0dbf0a92283855bd&scene=2&srcid=0228q2ERegxHPTpYt5TsjD4U#rd
阿里云提供了docker Hub：http://dev.aliyun.com/search.html  
极客学院：Docker开发知识体系图：http://www.jikexueyuan.com/path/docker/ - 简单

3. php常见的五种排序算法：http://mp.weixin.qq.com/s?__biz=MzI0MjEwMDMzNQ==&mid=403175052&idx=1&sn=cfaa5d2590899b3ba60e0875ce69d655&scene=1&srcid=0307zxQ7P9cl9gZ7VFHu8DfF#rd - Swoole半桶水

4. Docker简明教程：https://mp.weixin.qq.com/s?__biz=MzA5OTAyNzQ2OA==&mid=401816155&idx=1&sn=a7543ef15cda28c13e28a9e54ef631a8&scene=1&srcid=0304i4kpmUBOvN1giMnn1t4t&key=710a5d99946419d9d683ef90e930fd8a9d5edfbe8150f0865bd254b2c170e4703ecdc0c40a99ee0734351b78efcd8968&ascene=0&uin=MTYxNTIzMzI4MA%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.3+build(15D21)&version=11020201&pass_ticket=tnUMcVr5h4BqlVujzrbrcllS84KWQvNjtYD5qsWIHQM5M2OFSbCCGSmKftYgT1r%2B - 斯图尔特

5. NGINX 1.9.1 中的 Socket 切分：https://mp.weixin.qq.com/s?__biz=MjM5NTg2NTU0Ng==&mid=407459161&idx=3&sn=81c3db9915e319bd0756c3984a5ef8ba&scene=1&srcid=0305tNURM0DkItjcTAlkBgwR&key=710a5d99946419d9616d16f1ecb28d63e2e53d944a2a8066769c42f9ef02c455d738d35a24bd73b0d649d743e3bc5095&ascene=0&uin=MTYxNTIzMzI4MA%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.3+build(15D21)&version=11020201&pass_ticket=tnUMcVr5h4BqlVujzrbrcllS84KWQvNjtYD5qsWIHQM5M2OFSbCCGSmKftYgT1r%2B 

6. 如何处理监控类直播中遇到的奇葩问题【干货】：https://mp.weixin.qq.com/s?__biz=MzIyNDA1OTI2Nw==&mid=413655340&idx=1&sn=d4cd23eba212b8a806729900723b5251&scene=1&srcid=0306q692IHnIlyq4vfF5gMIX&key=710a5d99946419d90f342d9a5f6bed291b14c38492a8305bd2f45b5d312ab72d335589194b6e7ef5d22bd6d6a05fbcc1&ascene=0&uin=MTYxNTIzMzI4MA%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.3+build(15D21)&version=11020201&pass_ticket=tnUMcVr5h4BqlVujzrbrcllS84KWQvNjtYD5qsWIHQM5M2OFSbCCGSmKftYgT1r%2B
PostgreSQL 1000亿数据量 正则匹配 速度与激情-博客-云栖社区-阿里云：https://m.aliyun.com/yunqi/articles/7549?from=groupmessage&isappinstalled=0#index_section - 黑夜路人

7. 使用 Docker 容器应该避免的 10 个事情：https://mp.weixin.qq.com/s?__biz=MjM5NzM0MjcyMQ==&mid=402033815&idx=1&sn=1f6198787b5f299cc3c1c44f89f42258&scene=1&srcid=0307W4wFR3gIyrbPum0zVmWR&key=710a5d99946419d9418e2a7bc8ff898c898ab79f2d9b0acd869ae4b25f4b94a5de3b2a0475b959d3ab902f4d08d9a003&ascene=0&uin=MTYxNTIzMzI4MA%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.3+build(15D21)&version=11020201&pass_ticket=tnUMcVr5h4BqlVujzrbrcllS84KWQvNjtYD5qsWIHQM5M2OFSbCCGSmKftYgT1r%2B - 老虎

8. docker使用总结：http://card.weibo.com/article/h5/s#cid=1001603855970483702516&vid=1654778070&extparam=&from=&wm=0&ip=106.39.84.154 - 小刺猬@百合网

9. 我就是认真，为了一个net.ipv4.tcp_tw_recycle参数：https://mp.weixin.qq.com/s?__biz=MzA3MzYwNjQ3NA==&mid=403232978&idx=1&sn=4ed396ac1999add1c866419bd62b0e75&scene=1&srcid=0307Md90fGgT16SrLXEovHW1&key=710a5d99946419d9a7b4e4b7a9eee4c76a6902de52aff9f626f4390b8dba16a3b9d389d8987e66c764b142d1c41a4ca3&ascene=0&uin=MTYxNTIzMzI4MA%3D%3D&devicetype=iMac+MacBookPro12%2C1+OSX+OSX+10.11.3+build(15D21)&version=11020201&pass_ticket=tnUMcVr5h4BqlVujzrbrcllS84KWQvNjtYD5qsWIHQM5M2OFSbCCGSmKftYgT1r%2B - 再回到从前
