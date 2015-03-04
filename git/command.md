## 初始化配置 ##

```shell
git config --global user.name "Lancer He"
git config --global user.email "lancer.he@gmail.com"
git config --global color.diff auto # git diff 要顯示顏色
git config --global color.status auto # git status 要顯示顏色
git config --global color.branch auto
git config --global color.log auto # git log --graph 會很漂亮
```

储存临时空间，pull后在取出
```
git stash
git pull
git status
git stash pop stash@{0}
