---
layout: post
title: "Virtualbox direct access to SD Card in windows"
description: ""
date: 2018-08-08 17:35:00+0800
categories: ["virtualbox"]
tags:
  - "virtualbox"
  - "sd card"
author: kisaku
image:
comments: true
---
###### 1. Get the DirectID for your card reader.   
```terminal
C:\Program Files\Oracle\VirtualBox>wmic diskdrive list brief
Caption                         DeviceID            Model
    Partitions  Size
Innostor Innostor USB Device    \\.\PHYSICALDRIVE2  Innostor Innostor USB Device
    3           31132684800
SDHC Card                       \\.\PHYSICALDRIVE3  SDHC Card
    1           7945620480
ASP600S7-256GM-B                \\.\PHYSICALDRIVE0  ASP600S7-256GM-B
    4           256052966400
Samsung M3 Portable USB Device  \\.\PHYSICALDRIVE1  Samsung M3 Portable USB Devi
ce  1           2000396321280

```
###### 2. Navigate to the VirtualBox directory  
```terminal
cd C:\Program Files\Oracle\VirtualBox
```
###### 3. Create the link file to the SD card
```terminal
VBoxManage internalcommands createrawvmdk -filename "%USERPROFILE%/Desktop/sdcard.vmdk" -rawdisk "\\.\PHYSICALDRIVE3"
```
###### 4. Connect the VM to the SD card using the link
Now, open VirtualBox as administrator, and open the Settings for your virtual machine. Go to Storage -> Controller: SATA -> (right click) Add Hard Disk -> Choose Existing Disk and open the file you just created.

This post is referred to [VirtualBox direct access to SD Card in Windows](https://www.sandyscott.net/2013/08/14/virtualbox-direct-drive-access/) written by [Sandy Scott's Web Spot](https://www.sandyscott.net/). 

