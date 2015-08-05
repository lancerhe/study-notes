Application.ini 
```
routes.rewrite.type             = rewrite
routes.rewrite.match            = /pr/:name/:value
routes.rewrite.route.module     = Index
routes.rewrite.route.controller = List
routes.rewrite.route.action     = view
 
routes.regex.type             = "regex"
routes.regex.match            = "#^/list-([a-zA-Z-_0-9]+)-([a-zA-Z-_0-9]+).html#"
routes.regex.route.module     = Index
routes.regex.route.controller = List
routes.regex.route.action     = list
routes.regex.map.1            = category        //正则匹配 "\1"第一个元素
routes.regex.map.2            = id              //正则匹配 "\2"第一个元素
```

Rewrite模式访问
http://192.168.1.110/pr/viewport/231
路由抓取/pr/这种结构后，将会解析到对应的模块，控制器，方法中，
把第一个参数当作变量name, 第二个参数当作变量value，
 
Regex模式访问
http://192.168.1.110/list-android-43.html
路由抓取到 ^/list-([a-zA-Z-_0-9]+)-([a-zA-Z-_0-9]+).html 这样的正则结构
会将第一个正则匹配的元素当作map.1中指定的变量，第二个正则匹配的元素当作map.2中指定的变量，以此类推。

ListController.php
```php
Class ListController extends BaseController {
    public function init() {
        parent::init();
    }
 
 
    public function viewAction(){
        echo $this->getRequest()->getParam('name'); //viewport
        echo '<hr />';
        echo $this->getRequest()->getParam('value'); //231
    }
 
    public function listAction() {
        echo $this->getRequest()->getParam('category');  //android
        echo '<hr />';
        echo $this->getRequest()->getParam('id');  //43
    }
}
```