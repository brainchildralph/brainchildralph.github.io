---
layout: post
title: "ionic 筆記 - 初探"
description: "初步了解 ionic "
date: 2018-12-25 09:00:00+0800
date_modified: 2018-12-25 09:00:00+0800
categories: ["ionic","android","ios"]
tags:
  - "ionic"
  - "android"
  - "ios"
author: brainchildralph
image:
  path: https://upload.wikimedia.org/wikipedia/commons/2/24/Ionic-logo-landscape.svg
  width: 512
  height: 512
comments: true
---

### **[摘要 >](){:data-toggle="collapse" href="#summary"}**

<div markdown="1">

*   **[Installation](#installation-)**
*   **[Nodejs Testing](#nodejs-testing-)**

</div>{:class='collapse' id='summary'}

------    

#### **Installation >**
{:data-toggle="collapse" href="#installation-block"}

<div markdown="1">

**For Dockefile to install nodejs and Android SDK**

+   nodejs
    ```
    # For nodejs
    ARG NODEJS_VERSION="8"
    RUN apt-get update \
        && apt-get install -y \
           build-essential \
           curl \
           git \
        && curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash - \
        && apt-get update \
        && apt-get install -y nodejs
    ```


+   Android SDK
    ```
    ARG ANDROID_SDK_VERSION="3859397"
    ARG ANDROID_HOME="/opt/android-sdk"
    ARG ANDROID_BUILD_TOOLS_VERSION="26.0.0"
    
    ENV ANDROID_HOME "${ANDROID_HOME}"
    
    RUN apt-get update \
        && apt-get install -y \
           openjdk-8-jre \
           openjdk-8-jdk \
           unzip \
           gradle \
        && cd /tmp \
        && curl -fSLk https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip -o sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \
        && unzip sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \
        && mkdir /opt/android-sdk \
        && mv tools /opt/android-sdk \
        && (while sleep 3; do echo "y"; done) | $ANDROID_HOME/tools/bin/sdkmanager --licenses \
        && $ANDROID_HOME/tools/bin/sdkmanager "platform-tools" \
        && $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
        && apt-get autoremove -y \
        && rm -rf /tmp/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip
    ```

</div>{:class='collapse' id='installation-block' style='margin-left: 2em;'}


#### **Nodejs Testing >**
{:data-toggle="collapse" href="#nodejs-block"}

<div markdown="1">

Run `npm init` to initial a testing package. 
Then, run `npm install --save-dev ionic` to install ionic into local package. 

Because you install `ionic` into local package, so you need to add `ionic` command into `"scripts"` on `package.json`. 

**[package.json](javascript:void(0))**
{:data-toggle="collapse" href="#packagejson-block"}
<div markdown="1">
```
{
  "name": "ionicTest",
  "version": "1.0.0",
  "description": "", 
  "main": "index.js",
  "scripts": {
    "ionic": "ionic",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "ionic": "^4.10.3"
  }
} 
```
</div>{:class='collapse' id='packagejson-block' style='margin-left: 2em;'}

Create `ionic.sh` to use ionic in package. 

**[ionic.sh](javascript:void(0))**
{:data-toggle="collapse" href="#ionicsh-block"}
<div markdown="1">
```
#!/bin/bash
[ ! -d 'node_modules' ] && npm install
npm run ionic -- ${@:1}
```
</div>{:class='collapse' id='ionicsh-block' style='margin-left: 2em;'}

Get the ionic usage command. 

```
./ionic.sh --help
```

Ionic usage: 

```
  Global Commands:

    config <subcommand> ............. Manage CLI and project config values 
                                      (subcommands: get, set, unset)
    docs ............................ Open the Ionic documentation website
    info ............................ Print project, system, and environment 
                                      information
    init ............................ (beta) Initialize existing projects with 
                                      Ionic
    login ........................... Login to Ionic Appflow
    logout .......................... Logout of Ionic Appflow
    signup .......................... Create an account for Ionic Appflow
    ssh <subcommand> ................ Commands for configuring SSH keys 
                                      (subcommands: add, delete, generate, list, 
                                      setup, use)
    start ........................... Create a new project
```

Create a blank project by runnig `./ionic.sh start myApp blank --type=ionic1 ` command, and you will get `myApp` folder.  

Add the same code into 'package.json' as below in `myApp` ionic package. 

```
  "scripts": {
    "ionic": "ionic",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

Then, you can run ionic command by `ionic.sh` to generate Android APP. 

```
```


</div>{:class='collapse' id='nodejs-block' style='margin-left: 2em;'}

