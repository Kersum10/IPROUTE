#!/bin/bash
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
