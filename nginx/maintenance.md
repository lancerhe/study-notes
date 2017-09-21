maintenance.conf

```
set $maintenance_status 0;

location = /maintenance-html.html {
    root /home/html;
}

location = /maintenance-json.html {
    root /home/html;
}

if (-f /home/html/maintenance.enable) {
    set $maintenance_status 1;
}

set $maintenance "${external_access}${maintenance_status}";
```

nginx.conf
```
http {

    map $remote_addr $external_access {
        default         1;
        218.104.234.92  0;
    }

    server {
        listen      80;
        server_name xxx.crackedzone.cn;
        root        /home/html/xxx.crackedzone.cn;
        index       index.html;

        include maintenance.conf;

        error_page 503 /maintenance-html.html;

        location / {
            if ($maintenance = 11) {
                return 503;
            }
        }
    }
}
```
