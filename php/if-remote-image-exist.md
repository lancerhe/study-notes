远程图片 方法一
```php
function img_exits($url) {
    $ch = curl_init();
    curl_setopt($ch, curlopt_url,$url);
    curl_setopt($ch, curlopt_nobody, 1); // 不下载
    curl_setopt($ch, curlopt_failonerror, 1);
    curl_setopt($ch, curlopt_returntransfer, 1);

    if(curl_exec($ch)!==false)
        return true;
    else
        return false;
}
```

远程图片 方法二
```php
function img_exists($url) {
    if(file_get_contents($url,0,null,0,1))
        return 1;
    else
        return 0;
}
```

URL是否存在
```php
function url_exists($url) {
    $head=@get_headers($url);
    if (is_array($head)) {
        return true;
    }
    return false;
}
```

JS方法
```javascript
function geturl(url) { 
    var xmlhttp = new activexobject("microsoft.xmlhttp"); 
    xmlhttp.open("get", url, false); 
    xmlhttp.send(); 
    if (xmlhttp.readystate == 4) 
        alert((xmlhttp.status == 200)? "文件存在": "文件不存在 "); 
}
```