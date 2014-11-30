```php
/**
 * 获取所有部门数据树形结构
 *
 * @access public
 * @return array 
 */
public function getDeptsTree( $depts=FALSE, $f_id=0 ) {
    //初始化depts为按照fid分组
    if ( $depts === FALSE ) {
        $temp  = $this->getDepts();
        $depts = array();
        foreach( $temp AS $row ) {
            $depts[$row['d_fid']][] = $row;
        }
    }

    //初始化tree结构,并且没有顶级目录，自动返回错误
    $tree = array();
    if ( ! is_array($depts[$f_id]) ) return FALSE;

    foreach ( $depts[$f_id] AS $childs ) {
        $d_id = $childs['d_id'];
        $tree[$d_id] = $childs;

        if ( isset( $depts[$d_id] ) AND is_array( $depts[$d_id] ) ) {
            $tree[$d_id]['d_childs'] = $this->getDeptsTree($depts, $d_id);
            unset($depts[$d_id]);
        }
    }
    return $tree;
}
```