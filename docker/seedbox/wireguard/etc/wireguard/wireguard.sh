#!/usr/bin/env sh

iptables -F

iptables -P OUTPUT DROP
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp -d 152.67.230.10 --dport 51820 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 6891 -j ACCEPT
iptables -A INPUT -p udp --dport 6891 -j ACCEPT
iptables -A INPUT -p tcp --dport 8112 -j ACCEPT
iptables -A INPUT -p tcp --dport 58846 -j ACCEPT

iptables -P FORWARD DROP

wg-quick up wg0

tail -f /dev/null
