---
layout: post
title: "Jekyll Mermaid Notes"
description: "Mermaid Notes"
date: 2019-01-29 15:00:00+0800
date_modified: 2019-01-29 15:00:00+0800
categories: ["jekyll","mermaid"]
tags:
  - "jekyll"
  - "mermaid"
author: brainchildralph
image:
comments: true
mermaid: true
---

### **摘要**

------    

Code: 
```vim
graph LR
A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D
```
Result: 
```mermaid
graph LR
A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D
```

