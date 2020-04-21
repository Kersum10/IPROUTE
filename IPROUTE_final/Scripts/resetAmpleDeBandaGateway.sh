#!/bin/bash
#http://man7.org/linux/man-pages/man8/tc-ets.8.html
tc qdisc change dev eth0 root handle 1: prio bands 8 priomap 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7 7
