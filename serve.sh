#!/bin/bash
#PATH=/root/.rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#ip=$(ifconfig eth0 | grep inet | awk '{print $2}' | sed 's/addr://')
ip=0.0.0.0
port=4444
bundle exec jekyll serve --host ${ip} --port ${port}
