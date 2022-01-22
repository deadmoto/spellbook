#!/usr/bin/env sh

ulogd --daemon
cat /var/log/ulogd.log

# Wireguard would route all but it's own packets via wg0
ip route add to 192.168.0.0/24 via $(ip route show default | cut -d ' ' -f 3) dev eth0

iptables -F

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport 8112 -j ACCEPT # Deluge - Web UI
iptables -A INPUT -p tcp --dport 6891 -j ACCEPT
iptables -A INPUT -p udp --dport 6891 -j ACCEPT
iptables -A INPUT -j NFLOG --nflog-group 0 --nflog-prefix "INPUT dropped: "

iptables -P FORWARD DROP
iptables -A FORWARD -j NFLOG --nflog-group 0 --nflog-prefix "FORWARD dropped: "

iptables -P OUTPUT DROP
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 6891 -j DROP # Deluge - BitTorrent
iptables -A OUTPUT -o eth0 -p udp --dport 5351 -j DROP # Deluge - PCP / NAP Port Mapping
iptables -A OUTPUT -o eth0 -p udp --dport 1900 -j DROP # Deluge - UPnP
iptables -A OUTPUT -o eth0 -p udp --dport 6771 -j DROP # Deluge - BitTorrent Local Peer Discovery
iptables -A OUTPUT -o eth0 -d 224.0.0.0/4 -j DROP      # Deluge - IGMP Multicast
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -p udp -d 152.67.230.10 --dport 51820 -j ACCEPT
iptables -A OUTPUT -j NFLOG --nflog-group 0 --nflog-prefix "OUTPUT dropped: "

wg-quick up wg0
tail -f /var/log/ulogd_syslogemu.log
