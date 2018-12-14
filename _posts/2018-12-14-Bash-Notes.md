---
layout: post
title: "Bash Notes"
description: "About Some Bash Usage..."
date: 2018-12-03 17:00:00+0800
date_modified: 2018-12-03 17:00:00+0800
categories:
  - linux
  - bash
published: true
---
**Parameter replacement:**
```
${parameter/pattern/string}
```
**File Name and Extension**
```
# file's basename
b=$(basename -- ${filePath})
# Check if extension exists
if [[ $b == *"."* ]] ; then
  extension=${b##*.}
  name=${b%.*}
fi
```
