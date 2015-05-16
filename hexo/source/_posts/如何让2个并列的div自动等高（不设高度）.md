title: 如何让2个并列的div自动等高（不设高度）
date: 2015-05-16 14:56:42
tags:
- css
- html
categories:
- 布局
---
在做两栏布局的时候，左边往往是菜单，并且高度要和右边高度保持一致.
so,可以用以下3种方法:
1.背景模拟法（假高度），按照尺寸制作背景，平铺，当内容增多时，背景就会向下纵向重复，看起来就向左右两个div都自动向下延伸了一样。
2.表格嵌套法（不难理解，表格都是等高的，就是在div中嵌套表格）
3.内外补丁法（最推荐的方法，因为只用css实现的，但初学者不易理解）
<!-- more -->
```
    * { margin:0; padding:0; }
    #wrap {
        overflow:hidden; (这行代码是重点，否则你会看到页面很长很长)
        padding:0;
        padding-left:180px;（内补丁）
    }
    #left,#right {
        height:auto;
        margin-bottom:-10000px;（外补丁）
        padding-bottom:10000px;（内补丁）
    }
    #left {
        display:inline;
        float:left;
        width:180px;
        margin-left:-180px;（外补丁）
        background: #0CF;
    }
    #right{
        float:right;
        width:100%;
        background: #FC6;
    }
```
这里说一下内外补丁，其实也没那么难理解，我的理解就是相互抵消。多用用margin负值，你会了解这个原理的。