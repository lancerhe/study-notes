npm 速度慢，替换使用源
```
// A: 通过config命令
npm config set registry https://registry.npm.taobao.org 
npm info underscore （如果上面配置正确这个命令会有字符串response）
// B: 命令行指定
npm --registry https://registry.npm.taobao.org info underscore
// C: 编辑 ~/.npmrc 加入下面内容
registry = https://registry.npm.taobao.org
```
