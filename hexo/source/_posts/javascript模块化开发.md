title: javascript模块化开发
date: 2015-03-01 22:38:36
tags:
- javascript
- 分享
categories: ppt分享
---
当多人合作开发同一个项目的时候，能和好的协作开发，运应而生了js模块化开发
前端怎样来进行开发，AMD和CMD区别等，详细的查看ppt吧
<!-- more -->
<div id="imgContainer" class="fancybox">
</div>
下载：
<a href="/blog/resource/javascript模块化开发/javascript模块开发.pdf" target="_blank">javascript模块化开发.pdf</a>
<a href="/blog/resource/javascript模块化开发/javascript模块开发.ppt" target="_blank">javascript模块化开发.ppt</a>
<script>
var timer = setInterval(function(){
if(!window.$){
    return;
}
clearInterval(timer);
    var imgs = '';
    for(var i=1;i<=15;i++){
        imgs += '<img src="/blog/resource/javascript模块化开发/javascript模块开发/幻灯片'+ i +'.png"/><hr/>';
    }
    var $con = $('#imgContainer');
    $con.html(imgs);
    $con.fancybox({
        afterClose:function(){
            $con.show();
        }
    });
}, 200);

</script>