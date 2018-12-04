---
published: false
layout: post
date: '2018-12-04 15:48:00+0800'
date_modified: '2018-12-04 15:48:00+0800'
categories:
  - docker
---
### 解決docker容器中文亂碼，修改docker容器編碼格式

在 Dockfile 中，增加環境變數
```
...
ENV LANG C.UTF-8
...
```
或是用 -e 參數帶進去 
```
docker run ... -e 'LANG=C.UTF-8` ...
```
