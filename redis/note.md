
批量删除
```
redis-cli -h cache01.amazonaws.com keys "adredis_uid*" | xargs redis-cli -h cache01.amazonaws.com del
```
