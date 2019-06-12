---
---

### **Docker Kernel Information**

**[Gentoo](https://wiki.gentoo.org/wiki/Docker)**

**Kernel Configuration Sample:**

```

General setup  --->
    [*] POSIX Message Queues
    -*- Control Group support  --->
        [*]   Memory controller 
        [*]     Swap controller
        [*]       Swap controller enabled by default
        [*]   IO controller
        [ ]     IO controller debugging
        [*]   CPU controller  --->
              [*]   Group scheduling for SCHED_OTHER
              [*]     CPU bandwidth provisioning for FAIR_GROUP_SCHED
              [*]   Group scheduling for SCHED_RR/FIFO
        [*]   PIDs controller
        [*]   Freezer controller
        [*]   HugeTLB controller
        [*]   Cpuset controller
        [*]     Include legacy /proc/<pid>/cpuset file
        [*]   Device controller
        [*]   Simple CPU accounting controller
        [*]   Perf controller
        [ ]   Example controller 
    -*- Namespaces support
        [*]   UTS namespace
        -*-   IPC namespace
        [*]   User namespace
        [*]   PID Namespaces
        -*-   Network namespace
-*- Enable the block layer  --->
    [*]   Block layer bio throttling support
    -*- IO Schedulers  --->
        [*]   CFQ IO scheduler
            [*]   CFQ Group Scheduling support   
[*] Networking support  --->
      Networking options  --->
        [*] Network packet filtering framework (Netfilter)  --->
            [*] Advanced netfilter configuration
            [*]  Bridged IP/ARP packets filtering
                Core Netfilter Configuration  --->
                  <*> Netfilter connection tracking support 
                  *** Xtables matches ***
                  <*>   "addrtype" address type match support
                  <*>   "conntrack" connection tracking match support
                  <M>   "ipvs" match support
            <M> IP virtual server support  --->
                  *** IPVS transport protocol load balancing support ***
                  [*]   TCP load balancing support
                  [*]   UDP load balancing support
                  *** IPVS scheduler ***
                  <M>   round-robin scheduling
                  [*]   Netfilter connection tracking
                IP: Netfilter Configuration  --->
                  <*> IPv4 connection tracking support (required for NAT)
                  <*> IP tables support (required for filtering/masq/NAT)
                  <*>   Packet filtering
                  <*>   IPv4 NAT
                  <*>     MASQUERADE target support
                  <*>   iptables NAT support  
                  <*>     MASQUERADE target support
                  <*>     NETMAP target support
                  <*>     REDIRECT target support
        <*> 802.1d Ethernet Bridging
        [*] QoS and/or fair queueing  ---> 
            <*>   Control Group Classifier
        [*] L3 Master device support
        [*] Network priority cgroup
        -*- Network classid cgroup
Device Drivers  --->
    [*] Multiple devices driver support (RAID and LVM)  --->
        <*>   Device mapper support
        <*>     Thin provisioning target
    [*] Network device support  --->
        [*]   Network core driver support
        <M>     Dummy net driver support
        <M>     MAC-VLAN support
        <M>     IP-VLAN support
        <M>     Virtual eXtensible Local Area Network (VXLAN)
        <*>     Virtual ethernet pair device
    Character devices  --->
        -*- Enable TTY
        -*-   Unix98 PTY support
        [*]     Support multiple instances of devpts (option appears if you are using systemd)
File systems  --->
    <*> Overlay filesystem support 
    Pseudo filesystems  --->
        [*] HugeTLB file system support
Security options  --->
    [*] Enable access key retention support
    [*]   Enable register of persistent per-UID keyrings
    <M>   ENCRYPTED KEYS
    [*]   Diffie-Hellman operations on retained keys

```
{:style="background:black;color:white;"}
