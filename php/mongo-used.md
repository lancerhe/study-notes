```
<?php

/**
 * 连接MongoDB数据库  
 * 格式 "mongodb://username:password@host:port/database"
 * 详细资料:http://www.php.net/manual/en/mongo.connecting.php
 */
$connection = new Mongo();
$connection = new Mongo("192.168.1.102");
$connection = new Mongo("crackedzone.com:27017");
$connection = new Mongo("crackedzone.com", array("replicaSet"=>true)); //负载均衡
$connection = new Mongo("crackedzone.com", array("persist"=>"t")); //持久连接
$connection = new Mongo("mongodb://root:123@localhost");
$connection = new Mongo("mongodb://localhost:27017,localhost:27018");  //多个服务器
$connection = new Mongo("mongodb:///tmp/mongo-27017.sock");      #域套接字
$connection = new Mongo("mongodb://admin_miss:miss@localhost:27017/test", array('persist'=>'p',"replicaSet"=>true) );  #完整


/**
 * 选择数据库和数据集合
 * 注意:1.数据库和集合不需要事先创建,若它们不存在则会自动创建它们.
 *      2.注意错别字,你可能会无意间的创建一个新的数据库(与原先的数据库混乱).
 */
$db = $connection->weibo; //选择数据库 weibo
$db = $connection->selectDB("weibo"); //选择数据库 weibo

$collection = $db->feeds;   //选择数据集合 feeds
$collection = $connection->selectCollection('feeds');

$collection = $connection->weibo->feeds; //连缀

$dbs = $connection->listDBs(); //查询所有数据库


/**
 * 插入操作
 * 完整格式:insert ( array $array [, array $options = array('safe'=>false,'fsync'=>false,'timeout'=>10000) ] ) 
 *      safe    : 默认false,是否安全写入
 *      fsync   : 默认false,是否强制插入到同步到磁盘
 *      timeout : 超时时间(毫秒)
 */

// 向集合中简单插入
$row = array(
    'title'   => 'My Title',
    'content' => 'My Content',
);
$result = $collection->insert($row); //简单插入
var_dump($result); // 返回 bool(true)

// 向集合中安全插入数据，返回插入状态数组
$row = array(
    'fid'     => 4,
    'title'   => 'My Title Safe',
    'content' => 'My Content Safe',
);
// 用于等待MongoDB完成操作,以便确定是否成功.(当有大量记录插入时使用该参数会比较有用)
$result = $collection->insert($row, TRUE);
var_dump($result); // 返回 array(3) { ["err"]=> NULL ["n"]=> int(0) ["ok"]=> float(1) }

// 插入后的结果，其中'_id'为主键字段,在插入是MongoDB自动添加.
// { "_id" : ObjectId("5d63552ad549a02c01000009"), "fid":4, "title" : "My Title", "content" : "My Content" }


// 反正同样的继续被插入
$person = array("name" => "Joe", "age" => 20);
$collection->insert($person);

// 现在 $person 具有一个 _id 字段，所以我们再次 
// 保存它的时候，将会得到一个异常
try {
    $collection->insert($person, array("w" => 1));
} catch(MongoCursorException $e) {
    echo "Can't save the same person twice!\n";
}

// 参考http://www.php.net/manual/zh/mongocollection.insert.php




/**
 * 更新操作
 * 完整格式:update(array $criteria, array $newobj [, array $options = array()  ] )
 * 注意:1.注意区分替换更新与修改更新
 *      2.注意区分数据类型如 array('views'=>'684435')与array('views'=>684435)
 * 详细资料:http://www.mongodb.org/display/DOCS/Updating#Updating-%24bit
 */

// 修改部分
$where  = array('fid' => 4);
$update = array('title' => 'New Title', 'content' => 'New Content');
$result = $collection->update($where, array('$set' => $update) );
// $set:让某节点等于给定值, 类似的还有$pull $pullAll $pop $inc,在后面慢慢说明用法
// 原数据: { "_id" : ObjectId("5d63552ad549a02c01000009"), "fid":4, "title" : "My Title", "content" : "My Content" }
// 新数据: { "_id" : ObjectId("5d63552ad549a02c01000009"), "fid":4, "title" : "New Title", "content" : "New Content" }


// 替换数据
$where  = array('fid' => 4);
$update = array('title' => 'New Title', 'content' => 'New Content'); 
$result = $collection->update($where, $update );
// fid不见了
// 原数据: { "_id" : ObjectId("5d63552ad549a02c01000009"), "fid":4, "title" : "My Title", "content" : "My Content" }
// 新数据: { "_id" : ObjectId("5d63552ad549a02c01000009"), "title" : "New Title", "content" : "New Content" }

// 批量更新
$where  = array('fid' => 4);
$update = array('title' => 'New Title', 'content' => 'New Content'); 
$result = $collection->update($where, array('$set' => $update), array('multiple' => TRUE) );
// 所有 fid=4 都被修改， 没有multiple只修改一条


// 自动累加
$result = $collection->update($where, array('$set' => $update, '$inc' => array('views' => 1) ) );
// 更新数据的同时，views字段自增1,  '$inc' => array('veiws'=> -5) 表示自减5


// 删除节点
$result = $collection->update($where, array('$unset' => 'title') );
// 把fid=4的 title节点删除掉



/**
 * 删除文档
 */
$collection->remove(array('fid' => 4));
$collection->remove(); //删除整个集合，慎用

$id      = "5d63552ad549a02c01000009";
$mongoid = new MongoId($id); //转化MongoId
$collection->remove(array('_id' => $mongoid) );
$collection->remove(array('_id' => (object)$mongoid) );



/**
 * 查询文档
 */
// 文档记录数
$count = $collection->count();
// 查询fid=4 数据
$count = $collection->count(array('fid' => 4));
// 查询年龄大于20小于30的数据
$count = $collection->count(array('age' => array('$gt' => 20, '$lt' => 30)))

$count = $collection->find()->limit(5)->skip(0)->count(true);
// $gt为大于、$gte为大于等于、$lt为小于、$lte为小于等于、$ne为不等于、$exists不存在

$cursor = $collection->find()->snapshot();
foreach ($cursor AS $id => $value) {
    echo "$id: ";
    var_dump($value);
}

/**
 * 注意:
 *    在我们做了find()操作，获得$cursor游标之后，这个游标还是动态的.
 *    换句话说,在我find()之后,到我的游标循环完成这段时间,如果再有符合条件的记录被插入到collection,那么这些记录也会被$cursor获得.
 *    如果你想在获得$cursor之后的结果集不变化,需要这样做：
 *    $cursor = $collection->find();
 *    $cursor->snapshot();
 *    详见http://www.bumao.com/index.php/2010/08/mongo_php_cursor.html
 */

// 查询一条数据
// 注意:findOne()获得结果集后不能使用snapshot(),fields()等函数;
$cursor = $collection->findOne();

// 年龄和类型字段不显示
$cursor = $collection->find()->fields(array('age'=>FALSE, 'type'=>FALSE ) );

// 只显示user 列
$cursor = $collection->find()->fields(array("user"=>TRUE));

// 存在type, age!=0 and age<50
$cursor = $collection->find(array( 
    'type'=> array('$exists'=> TRUE), 
    'age' => array('$exists'=> TRUE, '$ne' => 0, '$lt' => 50) 
) );

// 分页显示，从第0条开始后取5条
$cursor = $collection->find()->limit(5)->skip(0);

// 排序
$cursor = $collection->find()->sort(array(
    'age' => -1,
    'type'=> 1
));
// 1 表示降序 -1表示升序 参数的先后影响排序顺序

/** 索引  **/
#1表示降序 -1表示升序
$collection->ensureIndex(array('age' => 1,'type'=>-1));
#索引的创建放在后台运行(默认是同步运行)
$collection->ensureIndex(array('age' => 1,'type'=>-1),array('background'=>true));
#该索引是唯一的
$collection->ensureIndex(array('age' => 1,'type'=>-1),array('unique'=>true));    
/**
 * ensureIndex (array(),array('name'=>'索引名称','background'=true,'unique'=true))
 * 详见:http://www.php.net/manual/en/mongocollection.ensureindex.php
 */


/** 分组 **/
// http://us.php.net/manual/en/mongocollection.group.php
$collection->insert(array("category" => "fruit", "name" => "apple"));
$collection->insert(array("category" => "fruit", "name" => "peach"));
$collection->insert(array("category" => "fruit", "name" => "banana"));
$collection->insert(array("category" => "veggie", "name" => "corn"));
$collection->insert(array("category" => "veggie", "name" => "broccoli"));
$keys    = array("category" => 1);
$initial = array("items" => array());
$reduce  = "function (obj, prev) { prev.items.push(obj.name); }";
$group   = $collection->group($keys, $initial, $reduce);
echo json_encode($group['retval']);


 /** 取得查询结果 **/
$cursor = $collection->find();
$data   = array();
foreach ($cursor as $id => $value) {
    $data[] = $value;
}


//正则匹配查询
$filter = array(
    'key' => new MongoRegex("/.*key-list-.*/i"),
);
$result = $collection->find($filter);

#关闭连接
$connection->close();
```
