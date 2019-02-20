#!/bin/bash
#PATH=/root/.rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#ip=$(ifconfig eth0 | grep inet | awk '{print $2}' | sed 's/addr://')

ip=0.0.0.0
port=4444
([ -n "$1" ] && [ "$1" == "start" ] ) && ( \
  start-stop-daemon -S -b -m -p /var/run/jekyll.pid -d $(pwd) -x $(which bundle) -- exec jekyll serve --host ${ip} --port ${port} \
 \
)
([ -n "$1" ] && [ "$1" == "stop" ] ) && ( kill -9 $(cat /var/run/jekyll.pid) )
