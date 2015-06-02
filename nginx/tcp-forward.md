Nginx 1.9+

```
stream {
    # QATEST MySQL
    server {
        listen 8306;
        proxy_pass 10.79.157.40:3300;
    }

    # RDTEST Passport
    server {
        listen 8600;
        proxy_pass 10.94.38.41:16000;
    }
}
```
