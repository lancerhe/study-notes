imit_req_zone $binary_remote_addr zone=reqip:10m rate=5r/s;

server {
        listen      80;
        server_name www.domain.com
        index       index.html index.htm index.php;
        root        /home/html/www.domain.com/public;

        client_max_body_size     10m;
        client_body_buffer_size  5m;
        fastcgi_buffer_size      128k;
        fastcgi_buffers          8 128k;
        fastcgi_connect_timeout  30;
        fastcgi_send_timeout     30;
        fastcgi_read_timeout     30;

        if ($host !~ "^((.*\.)?(domain1\.com|domain2\.com)|localhost|\d{1,3}(\.\d{1,3}){3})(:\d+)?$") {
                return 403;
        }

        location ~* /(\.svn|\.git){
                deny all;
        }

        location ~* /\.(sql|bak|inc|old)$ {
                deny all;
        }

        if ( !-e $request_filename ) {
                rewrite ^(.*)$ /index.php?r=$1 last;
                break;
        }

        location ~ \.php$ {
                limit_req zone=reqip burst=5 nodelay;
                fastcgi_pass  127.0.0.1:9000;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include       fastcgi_params;
        }

        access_log  /var/log/nginx/www.domain.com-access.log main;
        error_log   /var/log/nginx/www.domain.com-error.log;
}
