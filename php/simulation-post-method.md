1. CURL方式：
```php
function _doPost($post){
    $cp = curl_init();

    curl_setopt($cp, CURLOPT_URL, $this->_getServerUrl() );
    curl_setopt($cp, CURLOPT_HEADER, FALSE);
    curl_setopt($cp, CURLOPT_POST, 1);
    curl_setopt($cp, CURLOPT_POSTFIELDS, $post);
    curl_setopt($cp, CURLOPT_RETURNTRANSFER, TRUE);

    $response = curl_exec($cp);
    curl_close($cp);
    return $response;
}
```
2. fsockopen方式：
```php
function _doSockPost($post) {
    $out = "POST /bbs/1/ HTTP/1.0\r\n";
    $out .= "Accept: * /*\r\n";
    //$out .= "Referer: $boardurl\r\n";
    $out .= "Accept-Language: zh-cn\r\n";
    $out .= "Content-Type: application/x-www-form-urlencoded\r\n";
    $out .= "User-Agent: Apache-HttpClient/UNAVAILABLE (java 1.4)\r\n";
    $out .= "Host: api.hiapk.com\r\n";
    $out .= 'Content-Length: '.strlen($post)."\r\n";
    $out .= "Expect: 100-continue\r\n";
    $out .= "Connection: Keep-Alive\r\n\r\n";
    $out .= $post;


    if(function_exists('fsockopen')) {
        $fp = @fsockopen( 'api.hiapk.com', 80, $errno, $errstr, 10);
    } elseif (function_exists('pfsockopen')) {
        $fp = @pfsockopen( 'api.hiapk.com', 80, $errno, $errstr, 10);
    } else {
        $fp = false;
    }

    
    if(!$fp) {
        return '';
    } else {
        stream_set_blocking($fp, $block);
        stream_set_timeout($fp, $timeout);
        @fwrite($fp, $out);
        $status = stream_get_meta_data($fp);
        if(!$status['timed_out']) {
            while (!feof($fp)) {
                if( ($header = @fgets($fp)) && ($header == "\r\n" ||  $header == "\n")) {
                    break;
                }
            }

            $stop = false;
            while(!feof($fp) && !$stop) {
                $data = fread($fp, ($limit == 0 || $limit > 8192 ? 8192 : $limit));
                $response .= $data;
                if($limit) {
                    $limit -= strlen($data);
                    $stop = $limit <= 0;
                }
            }
        }
        @fclose($fp);
    }

    return $response;
}
```