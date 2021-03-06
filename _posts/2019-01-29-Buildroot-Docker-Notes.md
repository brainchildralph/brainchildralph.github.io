---
layout: post
title: "Buildroot Docker Notes"
description: ""
date: 2019-01-29 15:00:00+0800
date_modified: 2019-02-20 18:00:00+0800
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

+ Before compile buildroot. 
  ```
  apt-get install -y libncurses-dev cpio bc libssl-dev syslinux extlinux
  apt-get install -y virtualbox
  ```
+ For Busybox configurations.     
  ```
  make busybox_menuconfig
  ```
+ For Linux kernel configurations. 
  ```
  make linux_menuconfig
  ```
+ For mkfs.ext2/3/4, please select `e2fsprogs`. 

+ Environment: 
  - TOPDIR: buildroot source directory. ex: $(TOPDIR) in `.config`. 
  - HOME: User's home directory. ex: Chage BR2_DL_DIR to BR2_DL_DIR="$(HOME)/dl" in `.config`. 
  - BASE_DIR: Output folder, and it is `output` folder in buildroot source code.

+ How to generate vdi file from image?
  - 
    ```
    $ VBoxManage convertfromraw ${hddImg} ${hddVdi} \
      --format VDI --uuid ${hddUUID}
    ```
  - If you want to fix the uuid, add the
 parameter `--uuid`. This will speed up developing. 

+ ifup/ifdown script example:
  - **/etc/network/interfaces**
    ```
    auto lo
    iface lo inet loopback
    
    auto eth0
    iface eth0 inet dhcp
      udhcpc_opts -b
    
    auto eth1
    iface eth1 inet static
      address 192.168.111.55
      netmask 255.255.255.0
      broadcast 192.168.111.255
    #  gateway 192.168.111.1
    ```
  - ifup/ifdown useful commands: 
    ```
    $ ifup -v eth0       # this will show what commands are executed.
    ```



</div>{:class='collapse' id='build-tips-block' style='margin-left: 0em;'}

#### **CGROUPS for Docker >**
{:data-toggle="collapse" href="#cgroups-block"}

<div markdown="1">
+ For buildroot, you have to create cgroups by manaul, 
  there is a sample scripts for it. 
  ```shell
  mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
  cd /sys/fs/cgroup
  for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do 
    mkdir -p  $sys; 
    mount -n -t cgroup -o $sys cgroup $sys; 
  done
  ```
</div>{:class='collapse' id='cgroups-block' style='margin-left: 0em;'}

#### **Dockerd initial script >**
{:data-toggle="collapse" href="#dockerd-init-block"}

<div markdown="1">

+ Dockerd initial script 
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

  **How to check if `/sys/fs/cgroup` mounted?**    
  A: To use command `mountpoint -q /sys/fs/cgroup`, and get return value. 
</div>{:class='collapse' id='dockerd-init-block' style='margin-left: 0em;'}

#### **SSH Server Config >**
{:data-toggle="collapse" href="#ssh-config-block"}

<div markdown="1">

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
</div>{:class='collapse' id='ssh-config-block' style='margin-left: 2em;'}

#### **Buildroot testing iso image >**
{:data-toggle="collapse" href="#iso-block"}

<div markdown="1">

You have to follow the steps as below to enable configuration to build iso file. Then, you can use it to test Virtualbox. 

 - Enable BR2_TARGET_SYSLINUX
 - Enable BR2_TARGET_ROOTFS_ISO9660

</div>{:class='collapse' id='iso-block' style='margin-left: 2em;'}

#### **Docker login problem (Solved) >**
{:data-toggle="collapse" href="#dockerlogin-problem-block"}

<div markdown="1">

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
After `ca-certificates` installed, this problem can be resolved. 

```
openssl genrsa -out client.key 4096
openssl req -new -x509 -text -key client.key -out client.cert
```

```
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
```

</div>{:class='collapse' id='dockerlogin-problem-block' style='margin-left: 2em;'}

#### **OpenWRT Image Testing>**
{:data-toggle="collapse" href="#openwrt-block"}

<div markdown="1">

Import openwrt x86 rootfs. 
```
$ docker import http://downloads.openwrt.org/attitude_adjustment/12.09/x86/generic/openwrt-x86-generic-rootfs.tar.gz openwrt-x86-generic-rootfs
$ docker images
REPOSITORY                           TAG                   IMAGE ID            CREATED             VIRTUAL SIZE
openwrt-x86-generic-rootfs           latest                2cebd16f086c        6 minutes ago       5.283 MB
```
Run shell for docker image, and mapping `/tmp/test` folder for some usage. 
```
$ docker run --name test --rm -v /tmp/test:/tmp/test -it openwrt-x86-generic-rootfs /bin/ash
```
After enter OpenWRT shell, you can modify `inittab` and some config files. 

**inittab:** 
```
::sysinit:/etc/init.d/rcS S boot
::shutdown:/etc/init.d/rcS K shutdown
# Add for console. 
console::askfirst:/bin/ash --login
# Mark below lines. 
#ttyS0::askfirst:/bin/ash --login
#tty1::askfirst:/bin/ash --logi
```

Change the uhttpd listen ports to 8080 and 8443. 

**/etc/config/uhttpd:**
```
config uhttpd 'main'
        option home '/www'
        option rfc1918_filter '1'
        option max_requests '3'
        option cert '/etc/uhttpd.crt'
        option key '/etc/uhttpd.key'
        option cgi_prefix '/cgi-bin'
        option script_timeout '60'
        option network_timeout '30'
        option tcp_keepalive '1'
        option listen_https '0.0.0.0:8443'
        option listen_http '0.0.0.0:8080'
...
```
Change the ssh listen port to 2222. 
**/etc/config/dropbear:**
```
config dropbear
        option PasswordAuth 'on'
        option RootPasswordAuth 'on'
        option Port '2222'
```
Then, copy `/etc` to `/tmp/test`. 
```
$ cp -a /etc /tmp/test
```
Finally, run whole service on OpenWRT. 
```
$ docker run --name test --rm -v /tmp/test/etc:/etc --privileged -it openwrt-x86-generic-rootfs /sbin/init
```
</div>{:class='collapse' id='openwrt-block' style='margin-left: 2em;'}

