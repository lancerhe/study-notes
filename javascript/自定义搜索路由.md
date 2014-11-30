javascript:
```javascript
$('#search-btn').bind('click', function(){
    var searchkey = $('#search-txt').val();
    searchkey = searchkey.replace(/(^\s*)|(\s*$)/g, "");
    if( searchkey == '' ){
        return false;
    }
    searchkey = encodeURIComponent(searchkey);
 
    if ( window.location.pathname.indexOf('search') != -1 ) {
        location.href = '/search/'+searchkey;
    } else {
        window.open('/search/'+searchkey);
        $('#search-txt').val('');
    }
});
$("#search-txt").bind('keyup', function() {
    var e = e || window.event;
    if(e.keyCode == 13){
        $('#search-btn').trigger('click');
    }
});
```

HTML:
```html
<input type="text" class="bbs-search-int" id="search-txt" value="{{if $keyword}}{{$keyword}}{{else}}请输入搜索内容{{/if}}" onFocus="if(this.value == '请输入搜索内容'){this.value = '';}" onBlur="if(this.value == ''){this.value = '请输入搜索内容';}" autocomplete="off" x-webkit-speech speech />
 
<a href="javascript:;" title="搜索" id="search-btn" class="bbs-search-link">搜索</a>
```

PHP:
```php
trim( urldecode( $id ))
```