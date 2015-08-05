php_dex.h

```c
PHP_MINIT_FUNCTION(dex);
PHP_MSHUTDOWN_FUNCTION(dex);
```

dex.c
```c

PHP_INI_BEGIN()
PHP_INI_ENTRY("dex.debug", "hello debug", PHP_INI_ALL, NULL)
PHP_INI_END()

PHP_FUNCTION(dex_mock) {
    RETURN_STRING(INI_STR("dex.debug"), 1);
}
```

dex.ini
```
[dex]
extension = dex.so
dex.debug = ycustom
```