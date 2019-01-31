---
layout: post
title: "Buildroot Docker Notes"
description: ""
date: 2019-01-29 15:00:00+0800
date_modified: 2019-01-29 15:00:00+0800
categories: ["docker","buildroot"]
tags:
  - "docker"
  - "buildroot"
author: brainchildralph
image:
comments: true
mermaid: true
---

### **摘要**

------    

#### Build Tips

For Busybox configurations. 
```
make busybox_menuconfig
```
For Linux kernel configurations. 
```
make linux_menuconfig
```
For mkfs.ext2/3/4, please select `e2fsprogs`. 



#### CGROUPS for Docker

For buildroot, you have to create cgroups by manaul, there is a sample scripts for it. 

```shell
mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
cd /sys/fs/cgroup
for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do 
  mkdir -p  $sys; 
  mount -n -t cgroup -o $sys cgroup $sys; 
done
```
#### SSH Server Config

/etc/ssh/sshd_config
```
PermitRootLogin yes
PasswordAuthentication yes
PermitEmptyPasswords yes
```
Remember to restart sshd...
```
/etc/init.d/S50sshd restart
```
You can set root password empty, because of above configuation.   

```
touch pwd
passwd root < ./pwd
```


#### Buildroot testing iso image

You have to follow the steps as below to enable configuration to build iso file. Then, you can use it to test Virtualbox. 

 - Enable BR2_TARGET_SYSLINUX
 - Enable BR2_TARGET_ROOTFS_ISO9660


#### Docker login problem (Solved)

Problem: when docker login, I met as below...

```
docker login
WARN[2019-01-29T06:57:34.928602543Z] failed to retrieve runc version: unknown output format: runc version commit: v1.0.0-rc6
spec: 1.0.1-dev
 
WARN[2019-01-29T06:57:34.929702404Z] failed to retrieve docker-init version: exec: "docker-init": executable file not found in $PATH 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: bearout
Password: 
INFO[2019-01-29T06:57:41.245019014Z] Error logging in to v2 endpoint, trying next endpoint: Get https://registry-1.docker.io/v2/: x509: certificate signed by unknown authority 
ERRO[2019-01-29T06:57:41.247284107Z] Handler for POST /v1.39/auth returned error: Get https://registry-1.docker.io/v2/: x509: certificate signed by unknown authority 
Error response from daemon: Get https://registry-1.docker.io/v2/: x509: certificate signed by unknown authority
```
After `ca-certificates` installed, this problem can't be resolved. 

```
openssl genrsa -out client.key 4096
openssl req -new -x509 -text -key client.key -out client.cert
```

```
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
```


