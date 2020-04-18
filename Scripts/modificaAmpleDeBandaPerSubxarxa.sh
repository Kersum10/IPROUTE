#!/bin/bash

tc qdisc add dev eth1 parent 1:$1 handle 1: tbf rate $2 latency 50ms burst 1540
#tc qdisc add dev eth0 parent 1:$1 handle 1: tbf rate $2 latency 50ms burst 1540

echo "$1 cambiado $2"

