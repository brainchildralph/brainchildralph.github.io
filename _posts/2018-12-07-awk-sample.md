---
published: true
layout: post
title: 'awk 常見問題'
date: 2018-12-07 11:00:00+0800
date_modified: 2018-12-07 11:00:00+0800
categories:
  - "linux"
  - "awk"
---

#### Field Seperator

**How to use “:” as awk field separator?**

Example: 

```
$ awk -F: '{print $1}' <<< "1:2:3"
1
$ awk -v FS=: '{print $1}' <<< "1:2:3"
1
$ awk '{print $1}' FS=: <<< "1:2:3"
1
$ awk 'BEGIN{FS=":"} {print $1}' <<< "1:2:3"
1
```



