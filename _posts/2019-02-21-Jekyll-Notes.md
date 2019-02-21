---
layout: post
title: "Jekyll Notes"
description: "Jekyll Notes"
date: 2019-02-21 09:00:00+0800
date_modified: 2019-02-21 09:00:00+0800
categories: ["jekyll"]
tags:
  - "jekyll"
author: brainchildralph
image:
comments: true
---

+ **使用`start-stop-daemon`啟動Jekyll**
  - **jekyll.sh**
    ```
#!/bin/bash
ip=0.0.0.0
port=4444
([ -n "$1" ] && [ "$1" == "start" ] ) \
  && ( start-stop-daemon -S -b -m -p /var/run/jekyll.pid \
  -d $(pwd) -x $(which bundle) \
  -- exec jekyll serve --host ${ip} --port ${port} \
 \
)
([ -n "$1" ] && [ "$1" == "stop" ] ) \
  && ( kill -9 $(cat /var/run/jekyll.pid) )
    ```
