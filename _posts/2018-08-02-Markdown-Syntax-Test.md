---
layout: post
title: "Markdown 基本語法測試"
description: "Markdown 基本語法測試"
date: 2018-09-08 19:08:00+0800
categories: [markdown]
tags:
  - markdown
author: kisaku
image:
  path: /img/2018-08-02-Markdown-Syntax-Test/md_logo.jpg
  width: 1280
  height: 777
comments: true
---

###  # 用法

  # 有幾個，代表 Hn，例如：# 代表 H1，## 代表 H2，以此類推，##### 代表 H5。


語法：

```vim

#       H1 標題 
##      H2 標題 
###     H3 標題 
####    H4 標題 
#####   H5 標題 
######  H6 標題 

```
輸出：

<div markdown="1"  class="d-block bg-output"> 
#       H1 標題 
##      H2 標題 
###     H3 標題 
####    H4 標題 
#####   H5 標題 
######  H6 標題 
</div>

***

###  - 和 = 

語法：

```vim

# 三個 - 或 = 

減號標題為 H2
---

等號標題為 H1
===

```

輸出：

<div markdown="1"  class="d-block bg-output"> 
減號標題為 H2
---

等號標題為 H1
===
</div>

***

### 分隔線

```vim

* * *

***

*****

- - -

---------------------------------------

```

輸出：

<div markdown="1"  class="d-block bg-output"> 

* * *

***

*****

- - -

---------------------------------------

</div> 

<br/>

***

### Code 程式碼區塊
to be continued...

### 區塊引言
```vim
> 測試區塊引言  
> fbsbfhbsfbs   
> xxxfjenfnjs  
> fbsbfsbh   
> fnsjbfsbjf   
{:.bg-info}
> 測試區塊引言  
> fbsbfhbsfbs  
> fnsjbfsbjf  
{:.bg-info}
```
輸出：
> 測試區塊引言  
> fbsbfhbsfbs   
> xxxfjenfnjs  
> fbsbfsbh   
> fnsjbfsbjf   
{:.bg-info}
> 測試區塊引言  
> fbsbfhbsfbs  
> fnsjbfsbjf  
{:.bg-info}




