---
title: "部署自己的hugo"
date: 2023-07-11T17:12:43+08:00
draft: false
author: 'Gic'
description: 'hugo的部署文档见解，可能也有错的，请见谅'
tag: ['技术']
---
## 部署  

### window上执行命令  
  
```cassandraql
choco install hugo -confirm  

```  

### 查看hugo是否安装成功（查看版本）  

```cassandraql
hugo version  

```  

### hugo创建项目  

```cassandraql
hugo new site alibaba  
这个命令会创建一个名为alibaba 的博客目录，这就是站点的根目录。目录结构如下：  
├── archetypes  
│   └── default.md  
├── hugo.toml         # 博客站点的配置文件  
├── content             # 博客文章所在目录  
├── data  
├── layouts             # 网站布局  
├── static              # 一些静态内容  
└── themes              # 博客主题  
```  

### 下载主题和  

```yaml
本博客的主题 https://github.com/lukeorth/poison.git  
git clone https://github.com/lukeorth/poison.git themes/poison  
```  

### 应用主题  

```yaml
修改根目录下的hugo.toml  
增加：  
theme = 'poison'  
paginate = 10  
pluralizelisttitles = false   # removes the automatically appended "s" on sidebar entries  
```  

### 创建一篇文章  

```yaml
hugo news posts/my-first-post.md  
```
### 编辑文件  
上面命令生成的站点内容文件在content/post/my-first-post.md  

```yaml
---  
title: "My First Post"  
date: 2022-11-20T09:03:20-08:00  
draft: true  
---  
```  

这里面的draft设置成false的话就是不需要操作，hugo server后就可以看到效果，但是如果是草稿，hugo server命令执行后是看不到的，需要使用hugo server -D 在本机才能看到展示  

### 运行  

```yaml
hugo server # 查看发布的  
hugo server -D # 包含草稿 draft: true的标识  
```  

### 编译成静态文件
```yaml
hugo  # 执行命令后会出现public的文件夹，我们只需要将这文件夹拷贝放到站点即可
```

###  docker 资源挂载方式部署
nginx镜像资源挂载方式
```yaml
---
version: '2'
  nginx:
    restart: always
    image: nginx
    container_name: nginx
    ports:
      - 80:80
    volumes:
      - /data/nginx/nginx.conf:/etc/nginx/nginx.conf  ## 这个网上查下或者用官方的
      - /data/nginx/conf.d:/etc/nginx/conf.d
      - /data/nginx/public:/usr/share/nginx/html
      - /data/nginx/log:/var/log/nginx
```

## docker镜像部署
dockerfile
```yaml
## gudong dockerfile
FROM nginx:alpine
WORKDIR /
ADD ./public /usr/share/nginx/html
COPY ./nginx_conf/gudong.conf /etc/nginx/conf.d/
EXPOSE 80
ENV NAME Gic
CMD ["nginx", "-g", "daemon off;"]
```
compose文件类似资源挂载的方式，只不过不需要资源挂载了。
不过hugo.toml的文件里的baseURL记得修改成对应站点的地址，否则无法正常渲染访问

