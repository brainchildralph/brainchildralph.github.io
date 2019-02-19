---
layout: post
title: "Buildroot Docker Notes"
description: ""
date: 2019-01-29 15:00:00+0800
date_modified: 2019-02-19 10:00:00+0800
categories: ["docker","buildroot"]
tags:
  - "docker"
  - "buildroot"
author: brainchildralph
image:
comments: true
mermaid: true
---

### **[摘要 >](){:data-toggle="collapse" href="#summary"}**

<div markdown="1">

*   **[Build Tips](#build-tips-)**
*   **[CGROUPS for Docker](#cgroups-for-docker-)**
*   **[Dockerd initial script](dockerd-initial-script-)**

</div>{:class='collapse' id='summary'}

------    

#### **Build Tips >** ####     
{:data-toggle="collapse" href="#build-tips-block"}

<div markdown="1">

+ For Busybox configurations.     
  ```
  make busybox_menuconfig
  ```
+ For Linux kernel configurations. 
  ```
  make linux_menuconfig
  ```
+ For mkfs.ext2/3/4, please select `e2fsprogs`. 

</div>{:class='collapse' id='build-tips-block' style='margin-left: 0em;'}

#### **CGROUPS for Docker >**
{:data-toggle="collapse" href="#cgroups-block"}

<div markdown="1">

For buildroot, you have to create cgroups by manaul, there is a sample scripts for it. 

```shell
mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
cd /sys/fs/cgroup
for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do 
  mkdir -p  $sys; 
  mount -n -t cgroup -o $sys cgroup $sys; 
done
```
</div>{:class='collapse' id='cgroups-block' style='margin-left: 2em;'}

#### **Dockerd initial script >**
{:data-toggle="collapse" href="#dockerd-init-block"}

<div markdown="1">

```
#!/bin/sh

DAEMON="dockerd"
PIDFILE="/var/run/docker.pid"

DOCKERD_ARGS="-s overlay2"

# shellcheck source=/dev/null
[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"


cgroupfs_mount() {
        if ! `mountpoint -q /sys/fs/cgroup`; then
                mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
        fi
        cd /sys/fs/cgroup
        for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
                mkdir -p  $sys;
                if ! `mountpoint -q $sys`; then
                        mount -n -t cgroup -o $sys cgroup $sys;
                fi
        done
}

start() {
        printf 'Starting %s: ' "$DAEMON"
        cgroupfs_mount
        start-stop-daemon -b -S -q -x "/usr/bin/$DAEMON" \
                -- $DOCKERD_ARGS
        status=$?
        if [ "$status" -eq 0 ]; then
                echo "OK"
        else
                echo "FAIL"
        fi
        return "$status"
}

stop() {
        printf 'Stopping %s: ' "$DAEMON"
        start-stop-daemon -K -q -p "$PIDFILE"
        status=$?
        if [ "$status" -eq 0 ]; then
                rm -f "$PIDFILE"
                echo "OK"
        else
                echo "FAIL"
        fi
        return "$status"
}

restart() {
        stop
        sleep 1
        start
}

case "$1" in
        start|stop|restart)
                "$1";;
        reload)
                # Restart, since there is no true "reload" feature.
                restart;;
        *)
                echo "Usage: $0 {start|stop|restart|reload}"
                exit 1
esac    

```

*   **How to check if `/sys/fs/cgroup` mounted?**    

    A: To use command `mountpoint -q /sys/fs/cgroup`, and get return value. 

</div>{:class='collapse' id='dockerd-init-block' style='margin-left: 2em;'}


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



