---
layout: post
title: "Python - Hello world!!"
description: "第一個Python程式，當然是Hello World啦!"
date: 2018-08-01 05:24:00+0800
date_modified: 2018-08-01 05:24:00+0800
categories: [python]
tags:
  - python
author: kisaku
image:
  path: /img/2018-08-01-Python-Learn-By-Myself-001/hello.jpg
  width: 1280
  height: 777
comments: true
---

##### 第一個Python程式，當然是Hello World啦!
<br>
要不然勒~
<br>
使用linux的Terminal，敲上`python`，就可以直接用命令模式，試驗python語法，第一個當然是在視窗上，列印Hello World囉！！

```terminal
# python
Python 2.7.12 (default, Dec  4 2017, 14:50:18) 
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> print('Hello World!!')
Hello World!!
>>> exit()
#
```
如果你覺得要像 shell script 的方式，請先確認你的python路徑。

```terminal
# which python

/usr/bin/python

```

然後編輯一個 python script 如下：


編輯 *hello.py*


```vim
#!/usr/bin/python

print('Hello World!!');

```

最後在 Terminal 上執行：


```terminal

# ./hello.py

Hello World!!


```


