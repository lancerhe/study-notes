> 转载自：<http://zyan.cc/post/389/>

```php
<?php  
/************************ 
* 函数用途：同一域名对应多个IP时，获取指定服务器的远程网页内容 
* 创建时间：2008-12-09 
* 创建人：张宴（blog.zyan.cc） 
* 参数说明： 
*    $ip   服务器的IP地址 
*    $host   服务器的host名称 
*    $url   服务器的URL地址（不含域名） 
* 返回值： 
*    获取到的远程网页内容 
*    false   访问远程网页失败 
************************/  
function HttpVisit($ip, $host, $url)     
{     
    $errstr = '';     
    $errno = '';  
    $fp = fsockopen ($ip, 80, $errno, $errstr, 90);  
    if (!$fp)     
    {     
         return false;     
    }     
    else    
    {     
        $out = "GET {$url} HTTP/1.1\r\n";  
        $out .= "Host:{$host}\r\n";     
        $out .= "Connection: close\r\n\r\n";  
        fputs ($fp, $out);     
  
        while($line = fread($fp, 4096)){  
           $response .= $line;  
        }  
        fclose( $fp );  
  
        //去掉Header头信息  
        $pos = strpos($response, "\r\n\r\n");  
        $response = substr($response, $pos + 4);  
      
        return $response;     
    }     
}  
  
//调用方法：  
$server_info1 = HttpVisit("72.249.146.213", "blog.zyan.cc", "/abc.php");  
$server_info2 = HttpVisit("72.249.146.214", "blog.zyan.cc", "/abc.php");  
$server_info3 = HttpVisit("72.249.146.215", "blog.zyan.cc", "/abc.php");  
?> 
```