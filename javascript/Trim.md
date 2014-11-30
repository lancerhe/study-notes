```javascript
var trimLeft = function(str){
    var whitespace = '\t\r\n ';
    while(str.length > 0 && whitespace.indexOf(str.substr(0, 1)) != -1){
   str = str.substr(1);
    }
    return str;
};
 
var trimRight = function(str){
    var whitespace = '\t\r\n ';
    while(str.length > 0 && whitespace.lastIndexOf(str.substr(str.length - 1, 1)) != -1){
   str = str.substr(0, str.length - 1);
    }
    return str;
};
 
var trim = function(str){
    return trimLeft(trimRight(str));
};
```