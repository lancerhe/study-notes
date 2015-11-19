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
```

重新检出
```
git reset --hard origin/master
```

修改上次提交的注释
```
git commit --amend -m "Add aritcle: Setting Up with AWS EC2"
```

Tag
```
git tag -a v1.0.0 -m "release version 1.0.0"
git push origin --tags
```

Branch
```
# 创建分支
git branch activerecord
# 切换分支
git checkout activerecord
# 推送到远端Github
git push origin activerecord
```
