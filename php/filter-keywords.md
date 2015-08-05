```php
$badkey = "共产党|国民党|爱情宣言";

$string = "我是不是共产党";
preg_match("/$badkey/i", $string, $matches);
if ( ! empty($matches) ) {
    echo "对不起，含有含有敏感字符，不允许发表";
} else {
    //do something...
}
print_r($matches);
```