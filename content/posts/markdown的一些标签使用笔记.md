---
title: "markdown的一些标签使用笔记"
date: 2023-07-11T17:10:47+08:00
draft: false
---

参考 [markdown官方](https://www.markdown.xyz/basic-syntax/#bold)  
# detail
*一个标记，先忽略，后面有彩蛋*

## 粗体 （Bold）   

```yaml   
This is **bold** text  
This is __bold__ text  
```
This is **bold** text  
This is __bold__ text  

## 斜体（Italic）

```yaml
this is *emphasized* text  
this is _emphasized_ text  
```   
this is *emphasized* text  
this is _emphasized_ text  

## 粗体（Bold）和斜体（Italic）

```yaml
This is ***bold*** text 
```   
This is ***bold*** text 

## 块引用（Blockquotes）

```yaml
> 这是块引用的例子
```   
> 这是块引用的例子

## 嵌套块引用（Nested Blockquotes）

```yaml
> 这是块引用的例子
>> 这是块引用的嵌入例子  ###记住后面要两个空格和回车
>> 这是块引用的嵌入例子
  # 内容上要引入其他的的元素，都可以直接使用
```  
 
> 这是块引用的例子  
>> 这是块引用的嵌入例子  
>> 这是块引用的嵌入例子

## 列表（Lists）

### 有序列表（Ordered Lists）

1. 第一行
    1. 第一行    # 前面是一个tab键或者空四个空
    2. 第二行
2. 第二行
    1. 第一行
    2. 第二行
    3. 第三行
1. 第四行
1. 第五行

### 无序列表（Unordered Lists）

- 第一行
    - 第一行    # 前面是一个tab键（制作表符）或者四个空格
    - 第二行
- 第二行
    - 第一行
    - 第二行
- 第三行
- 第四行
- 第五行

## 代码块（Code Blocks)
请将代码块的每一行缩进至少四个空格或一个制表符 ,或者用下面的围符号方式
```yaml
```（换行） 这样的（换行）  ```
`code`
```
`code`展示的是代码的样式


## 转义反引号
如果你要表示为代码的单词或短语中包含一个或多个反引号，则可以通过将单词或短语包裹在双反引号(``)中。
`` use `code` ``


## 分隔线（Horizontal Rules）
```yaml
*** # 第一种
--- # 第二种
___ # 第三种
```

*** 

--- 

___


## 图片（Images）
```yaml
![古东](/images/gudong.png)  
```
![古东](/images/gudong.png)  




## 超链接
```yaml
Visit the [Hugo](https://gohugo.io) website!  
```
Visit the [Hugo](https://gohugo.io) website!  

### 超链接添加标题  (鼠标悬停在超链接文字上就可以看到属性标题)

```yaml
Visit the [Hugo](https://gohugo.io "gohugo") website!  
```
Visit the [Hugo](https://gohugo.io "gohugo") website!  

## 网址和邮箱地址
```yaml
<http://www.wangsu.com>
<715759903@qq.com>
```
<http://www.baidu.com>  
<715759903@qq.com>

其他的一些用法可以查看文章前面的的Markdown官网链接。这边提个问题，如果这边要引用文章的前面的标题快速回首行，怎么做呢？  
```yaml
[首行](#detail)  
```
[首行](#detail)  





