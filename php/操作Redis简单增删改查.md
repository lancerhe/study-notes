```php
public function indexAction() {
    echo '
    <form action="/test/reg/" method="post">
        用户名: <input type="text" name="username" /><br />
        密码  : <input type="password" name="password" /><br />
        年龄  : <input type="text" name="age" /><br />
        <input type="submit" value="注册" />
        <input type="reset" value="重置" />
    </form>';
}
 
public function listAction() {
    $redis = new Redis();
    $redis->connect('localhost');
 
    $data = array();
    for($i=1; $i<=($redis->get('userid') ); $i++) {
        $data[] = $redis->hgetall("user:" . $i);
    }
    $data = array_filter($data);
    echo '<table border=1>
        <tr>
            <td>uid</td>
            <td>username</td>
            <td>age</td>
            <td>operation</td>
        </tr>';
    foreach ($data AS $row) {
    echo '<tr>
        <td>' . $row['uid']. '</td>
        <td>' . $row['username']. '</td>
        <td>' . $row['age']. '</td>
        <td>
            <a href="/test/delete/id/'.$row['uid'].'">删除</a>
            <a href="/test/update/id/'.$row['uid'].'">编辑</a>
        </td>
    </tr>';
    }
    echo '</table>';
}
 
public function regAction() {
    $redis = new Redis();
    $redis->connect('localhost');
 
    //设置一个自增的id
    $uid   = $redis->incr("userid");
 
    $row             = array();
    $row['uid']      = $uid;
    $row['username'] = $_POST['username'];
    $row['password'] = md5( $_POST['password'] );
    $row['age']      = intval( $_POST['age'] );
 
    $result = $redis->hMset('user:'.$uid, $row);
    $this->redirect('/test/list/');
}
 
public function doupdateAction() {
    $redis = new Redis();
    $redis->connect('localhost');
 
    $row             = array();
    $row['uid']      = $_POST['id'];
    $row['username'] = $_POST['username'];
    $row['age']      = intval( $_POST['age'] );
 
    $result = $redis->hMset('user:'.$row['uid'], $row);
    if ( $result )
        $this->redirect('/test/list/');
    else
        $this->redirect('/test/update/id/' . $row['uid']);
}
 
public function updateAction($id) {
    $redis = new Redis();
    $redis->connect('localhost');
 
    $user = $redis->hgetall('user:'.$id);
    echo '
    <form action="/test/doupdate/" method="post">
        <input type="hidden" value="'.$id.'" name="id" />
        用户名: <input type="text" name="username" value="'.$user['username'].'" /><br />
        年龄  : <input type="text" name="age" value="'.$user['age'].'" /><br />
        <input type="submit" value="更新" />
    </form>';
}
 
 
public function deleteAction($id) {
    $redis = new Redis();
    $redis->connect('localhost');
 
    $redis->del("user:".$id);
    $this->redirect('/test/list/');
}
```