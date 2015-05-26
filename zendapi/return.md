RETURN_RESOURCE(resource)
    返回一个资源。
RETURN_BOOL(bool)
    返回一个布尔值。
RETURN_NULL()
    返回一个空值。
RETURN_LONG(long)
    返回一个长整数。
RETURN_DOUBLE(double)
    返回一个双精度浮点数。
RETURN_STRING(string, duplicate)
    返回一个字符串。duplicate 表示这个字符是否使用 estrdup() 进行复制。
RETURN_STRINGL(string, length, duplicate)
    返回一个定长的字符串。其余跟 RETURN_STRING 相同。这个宏速度更快而且是二进制安全的。
RETURN_EMPTY_STRING()
    返回一个空字符串。
RETURN_FALSE
    返回一个布尔值假。
RETURN_TRUE
    返回一个布尔值真。

```c
PHP_FUNCTION(dex_string) {
    RETURN_STRING("hello world", 1);
}

PHP_FUNCTION(dex_long) {
    // ZVAL_LONG(return_value, 42);  // 两种模式
    // return 
    RETURN_LONG(43);
}

PHP_FUNCTION(dex_double) {
    RETURN_DOUBLE(3.14195623);
}

PHP_FUNCTION(dex_null) {
    RETURN_NULL();
}

# true
PHP_FUNCTION(dex_boolean) {
    RETURN_BOOL(1);
}
```
