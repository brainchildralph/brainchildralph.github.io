---
layout: post
title: How to slice an array in Bash
description: "About slice array in Bash"
date: 2018-12-03 17:00:00+0800
date_modified: 2018-12-03 17:00:00+0800
categories:
  - linux
  - bash
published: true
---
```
A=( foo bar "a b c" 42 )
B=("${A[@]:1:2}")
C=("${A[@]:1}")       # slice to the end of the array
echo "${B[@]}"        # bar a  b c
echo "${B[1]}"        # a  b c
echo "${C[@]}"        # bar a  b c 42
echo "${C[@]: -2:2}"  # a  b c 42 # The space before the - is necesssary
```
