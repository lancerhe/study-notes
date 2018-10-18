
批量删除
```
redis-cli -h cache01.amazonaws.com keys "adredis_uid*" | xargs redis-cli -h cache01.amazonaws.com del

redis-cli -h cache01.amazonaws.com -n 5 --scan --pattern "2018*" | xargs -L 100 -i redis-cli -h cache01.amazonaws.com -n 5 del {}
```
