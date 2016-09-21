    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" $content_length '
                      '$status $body_bytes_sent $request_time $upstream_response_time '
                      '$upstream_addr "$http_referer" "$http_user_agent" "$http_x_forwarded_for"';
