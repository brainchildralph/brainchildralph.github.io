---
layout: post
title: "Python - import, from, as"
description: "簡單範例使用 import, from, as"
date: 2018-08-06 10:58:00+0800
categories: [python]
tags:
  - python
author: kisaku
image:
comments: true
---

## import <file>  

當你想要使用某個檔案模組的功能時，使用 import 去載入，這時候載入的檔名，不包含副檔名 `py` ，為模組名稱，欲使用氁組下的功能或是類別 (class)，為模組名中間多個`.`，例如：  
  
終端機： 
{: .text-info} 
```terminal
# ls

class1.py  main.py  __pycache__ 

# python3 

Python 3.5.2 (default, Nov 23 2017, 16:37:01) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import class1
>>> a=class1.A('Ralph')
>>> a.hello()
hello!! I'm Ralph!!
>>> exit()
```

class.py：
{: .text-info} 
```
class A:
  def __init__(self, name):
    self.name=name;
  def hello(self):
    print('hello!!'+' I\'m '+self.name+'!!');
```




## import + as  

如果想要改變模組代號，可以加上 as ，去做改變，以下範例：  

```terminal
# ls

class1.py  main.py  __pycache__ 

# python3 

Python 3.5.2 (default, Nov 23 2017, 16:37:01) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import class1 as c1
>>> a=c1.A('Ralph')
>>> a.hello()
hello!! I'm Ralph!!
>>> exit()
```
## from <directory path> import <module path>  

如果將模組移動至某資料夾下，可以使用 from 去調用模組，範例如下：  
```terminal
ls -R
.:
class1.py  dir1  main.py  __pycache__  test1.py

./dir1:
class1.py  __pycache__  subdir1

./dir1/__pycache__:
class1.cpython-35.pyc

./dir1/subdir1:
class1.py  __pycache__

./dir1/subdir1/__pycache__:
class1.cpython-35.pyc

./__pycache__:
class1.cpython-35.pyc  main.cpython-35.pyc  test1.cpython-35.pyc
```
以上所有 class1.py 皆為相同，這時如果你想調用 dir1 下的 class1，加上 from dir1 import class1 即可。  
```terminal
# python3
Python 3.5.2 (default, Nov 23 2017, 16:37:01) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from dir1 import class1 
>>> a=class1.A('Ralph')
>>> a.hello()
hello!! I'm Ralph!!
>>> 
```
當然也可以加上 as ，去做更改模組代號，這邊同樣的把模組代號改成 c1 。  
```terminal
# python3
Python 3.5.2 (default, Nov 23 2017, 16:37:01) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from dir1 import class1 as c1
>>> a=c1.A('Ralph')
>>> a.hello()
hello!! I'm Ralph!!
>>> 
```
如果想調用 subdir1 中的 class1，相對路徑中的反斜線，改成 dot (.) 即可。
```terminal
# python3
Python 3.5.2 (default, Nov 23 2017, 16:37:01) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from dir1.subdir1 import class1 as c1
>>> a=c1.A('Ralph')
>>> a.hello()
hello!! I'm Ralph!!
>>> 
```

