### Python 2.7.3 安装
```bash
wget https://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
tar xf Python-2.7.3.tar.bz2
cd Python-2.7.3
./configure  --prefix=/usr/local/python-2.7.3
make && make install
ln -s /usr/local/python-2.7.3 /usr/local/python
ln -s /usr/local/python/bin/python  /usr/bin/py2
ln -s /usr/local/python/bin/python  /usr/local/bin/python

# 验证是否安装成功: 
python --version
```

### python 类库 easy-install 依赖库安装
```bash
yum install libxslt
yum install libxml2 -y
yum install libxslt-devel -y
 
wget https://bitbucket.org/pypa/setuptools/get/default.tar.gz
python setup.py install
ls -s /usr/local/python/bin/easy_install /usr/local/bin/easy_install
```

### python 类库(pyquery依赖于lxml cssselect)
```bash
# 下面的类库当easy-install不起作用的时候，可以通过下载包后python setup.py install安装
wget https://pypi.python.org/packages/source/c/cssselect/cssselect-0.9.1.tar.gz
wget https://pypi.python.org/packages/source/l/lxml/lxml-3.3.0.tar.gz
wget https://pypi.python.org/packages/source/p/pyquery/pyquery-1.2.4.tar.gz
wget https://pypi.python.org/packages/source/r/redis/redis-2.9.1.tar.gz
```

### python 类库 mysql 安装(请保证已经安装mysql)

```bash
wget http://nchc.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-1.2.2.tar.gz
 
vim site.cfg  #修改site.cfg中的
    threadsafe = False
    mysql_config = /usr/local/mysql/bin/mysql_config # 这个根据自己环境决定

# 执行命令：
export LD_LIBRARY_PATH=/usr/local/mysql/lib/mysql
ln -s /usr/local/mysql/lib/mysql/libmysqlclient.so /usr/lib/libmysqlclient.so.14
ldconfig

python setup.py build
python setup.py install
```

进入python终端：
```python
import MySQLdb
```
如果报错
```
/usr/lib/python2.7/site-packages/MySQL_python-1.2.2-py2.3-linux-i686.egg/_mysql.py:3: UserWarning: Module _mysql was already imported from /usr/lib/python2.3/site-packages/MySQL_python-1.2.2-py2.3-linux-i686.egg/_mysql.pyc, but /usr/local/src/MySQL-python-1.2.2 is being added to sys.path
```
原因是，install后MySQLdb模块已经被放到python的site pachages目录中；但我在当前目录也存在相同的模块，所以可能会重复导入。只要切换到其他目录运行py2就可以了。