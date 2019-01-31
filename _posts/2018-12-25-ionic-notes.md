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

### **摘要**

------    

To be continued....

#### Installation

For Dockefile 

nodejs

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

Android SDK    

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

