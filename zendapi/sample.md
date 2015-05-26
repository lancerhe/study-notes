```
PHP_FUNCTION(sample_calculate) {
    long a;
    long b;
    char *c;
    int c_len;
    char *str;
    if ( zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "lls", &a, &b, &c, &c_len) == FAILURE) {
        return;
    }

    int len = spprintf(&str, 0, "%s:%d", c, a * b);
    RETURN_STRINGL(str, len, 0);
}
```
