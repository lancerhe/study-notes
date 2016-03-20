#### 在Adminer尾部增加下以下代买用于区分线上与线下环境

```
<script>
        SpanTip = document.createElement("span");
        SpanTip.innerHTML = "[提示：属于区域为亚太-新加坡正式服务区，操作请谨慎]";
        SpanTip.style.color = "white";
        SpanTip.style.marginLeft = "20px";
        SpanTip.style.paddingLeft = "10px";
        SpanTip.style.paddingRight = "10px";
        SpanTip.style.paddingTop = "2px";
        SpanTip.style.paddingBottom = "2px";
        SpanTip.style.backgroundColor = "red"
        SpanTip.style.fontSize = "14px";
        document.getElementById("content").getElementsByTagName("h2")[0].insertBefore(SpanTip, null);
</script>
```
