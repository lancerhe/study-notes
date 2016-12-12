
出现 大量socket() failed (24: Too many open files) while connecting to upstream

```
worker_rlimit_nofile 10140;
events {
    worker_connections  10240;
}
```
