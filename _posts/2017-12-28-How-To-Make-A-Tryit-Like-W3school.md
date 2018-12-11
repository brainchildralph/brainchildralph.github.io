---
layout: post
title: "How to Make A Tryit Editor Like W3school"
description: "Make a code like w3school Tryit editor. "
date: 2017-12-28 09:00:00+0100
date_modified: 2018-08-01 18:00:00+0800
categories: [web]
tags:
  - web
  - w3school
  - tryit
author: kisaku
image:
  path: /img/2017-12-28-How-To-Make-A-Tryit-Like-W3school/1514530904887.jpg
  width: 1280
  height: 777
comments: true
---

如何做出一個 w3school Tryit 的程式編輯器。


#### 5秒鐘結束這一回合 ####

你只需要：
- textarea
- iframe

其實整個概念就是，取出textarea的內容，將她(請將程式碼當成是你的女友)顯示在iframe上

至於如何，顯示在iframe上，則必須使用到iframe的一個attribute - "srcdoc"，當srcdoc的值為HTML語法，iframe就會自動執行囉，世界是不是很美好阿~


不囉嗦，直接附上用w3school的Tryit實現自己的Tryit編輯器。

- W3school 的範例程式 - [Use w3school's Tryit to make Tryit!!](https://www.w3schools.com/code/tryit.asp?filename=FMXNC297H3UK)



