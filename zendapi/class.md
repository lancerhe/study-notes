```
zend_class_entry *myclass_ce;

static zend_function_entry myclass_method[] = {
    PHP_FE_END
};

PHP_MINIT_FUNCTION(sample_minit) {
    zend_class_entry ce;
    INIT_CLASS_ENTRY(ce, "myclass", myclass_method);
    myclass_ce = zend_register_internal_class(&ce TSRMLS_CC);
    return SUCCESS;
}

zend_module_entry sample_module_entry = {
    STANDARD_MODULE_HEADER,
    "sample", //这个地方是扩展名称，往往我们会在这个地方使用一个宏。
    NULL, /* Functions */
    PHP_MINIT(sample_minit), /* MINIT */
    NULL, /* MSHUTDOWN */
    NULL, /* RINIT */
    NULL, /* RSHUTDOWN */
    NULL, /* MINFO */
    "2.1", //这个地方是我们扩展的版本
    STANDARD_MODULE_PROPERTIES
};
```
