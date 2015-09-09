# 增加静态路由
```
route print
route add 192.168.1.160 mask 255.255.255.255 10.0.1.8
```

# 查看php进程消耗了多少内存
```
pmap $(pgrep php-fpm | head -1)
```
