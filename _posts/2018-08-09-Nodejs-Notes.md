---
layout: post
title: "Nodejs Day 1"
description: "Nodejs 自學筆記"
date: 2018-08-09 10:40:00+0800
categories: [nodejs]
tags:
  - nodejs
  - javascript
author: kisaku
image:
comments: true
---

##### 1. 建立信心，先來個 `Hello World!!` 吧！！

工作環境：Ubuntu 16.04 64 bit

hello.js  
{. text-info}
```
// print 'Hello world!!'
console.log("Hello World!!");
```

##### 2. `npm init` 建立專案。

```terminal
# mkdir xxx
# cd xxx
# npm init 
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (xxx) 
version: (1.0.0) 
description: npm init sample
entry point: (index.js) 
test command: 
git repository: 
keywords: npm init
author: kisaku
license: (ISC) 
About to write to /work/git/language/nodejs/package.json/xxx/package.json:

{
  "name": "xxx",
  "version": "1.0.0",
  "description": "npm init sample",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "npm",
    "init"
  ],
  "author": "kisaku",
  "license": "ISC"
}


Is this OK? (yes) 

```
然後系統會自動幫你生成 `package.json` ，接下來進入點定義為 "main": "index.js" ，


To be continued...
