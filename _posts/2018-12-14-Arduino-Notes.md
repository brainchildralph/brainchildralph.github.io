---
layout: post
title: "Arduino 常見問題"
description: "關於 Arduino 常見問題筆記"
date: 2018-12-14 18:00:00+0800
date_modified: 2018-12-14 18:00:00+0800
categories: ["arduino"]
tags:
  - "arduino"
author: brainchildralph
image:
comments: true
---

#### **Arduino UNO Pinout**    

{% include lightbox.html src="https://upload.wikimedia.org/wikipedia/commons/c/c9/Pinout_of_ARDUINO_Board_and_ATMega328PU.svg" title="Pinout of ARDUINO Board and ATMega328PU" width="500" %}    
<div markdown="1">  
<center>
<b>
<i markdown="1">["Pinout of ARDUINO Board and ATMega328PU"](https://commons.wikimedia.org/wiki/File:Pinout_of_ARDUINO_Board_and_ATMega328PU.svg){:.text-danger} by pighixxx</i><br/>
<i markdown="1">Licensed under [Creative Commons Attribution-Share Alike 4.0 International](https://en.wikipedia.org/wiki/Creative_Commons){:.text-danger}</i>
</b>
</center>
</div>

**[Language Reference](https://www.arduino.cc/reference/en/#functions)**

**flash-memory based strings**    
使用`F()`將字串存在Flash上面。    
```
Serial.print(F(“Hello World”));
```
**Ctags Recognizes .ino for C++ Format**     
```
ctags -R --langmap=C++:+.ino --verbose `pwd`
```

