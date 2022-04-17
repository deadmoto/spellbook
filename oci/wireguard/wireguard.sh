#!/usr/bin/env sh
# Wireshark Server startup script for Oracle Cloud Infrastructure.

echo Install packages
dnf install oraclelinux-developer-release-el8
dnf config-manager --disable ol8_developer
dnf config-manager --enable ol8_developer_UEKR6
dnf config-manager --save --setopt=ol8_developer_UEKR6.includepkgs='wireguard-tools*'
dnf install -y bind wireguard-tools

echo Enable NAT
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
sysctl -p

echo Enable Bind DNS server
echo "
options {
	listen-on port 53 { 172.16.0.1; };
	directory "/var/named";
  allow-query { any; };
	recursion yes;
  forwarders {
    8.8.8.8;
    8.8.4.4;
  };
  forward only;
  dnssec-enable yes;
  dnssec-validation yes;
};
" > /etc/named.conf
systemctl enable named
systemctl start named
firewall-offline-cmd --zone=trusted --add-port=53/udp

echo Enable IP masquerade
firewall-offline-cmd --zone=public --add-masquerade

echo Forward incoming Deluge traffic
firewall-offline-cmd --zone=public --add-forward-port=port=8112:proto=tcp:toport=8112:toaddr=172.16.0.2
firewall-offline-cmd --zone=public --add-forward-port=port=6891:proto=tcp:toport=6891:toaddr=172.16.0.2
firewall-offline-cmd --zone=public --add-forward-port=port=6891:proto=udp:toport=6891:toaddr=172.16.0.2

echo Allow Wireguard server traffic
firewall-offline-cmd --zone=public --add-port=51820/udp

echo Apply firewalld settings
systemctl restart firewalld

echo Retrieve OCI metadata
IFACE=$(ip -o -4 route show to default | awk '{print $5}' | head -n 1)
SERVER_PRIVATE_KEY=$(curl -H "Authorization: Bearer Oracle" -L http://169.254.169.254/opc/v2/instance/freeformTags/SERVER_PRIVATE_KEY)

echo Set up Wireguard
echo "[Interface]
PrivateKey          = ${SERVER_PRIVATE_KEY}
Address             = 172.16.0.1/12
ListenPort          = 51820
SaveConfig          = false
PostUp              = iptables -I FORWARD -i %i -j ACCEPT
PostUp              = iptables -t nat -A POSTROUTING -o ${IFACE} -j MASQUERADE
PostDown            = iptables -D FORWARD -i %i -j ACCEPT
PostDown            = iptables -t nat -D POSTROUTING -o ${IFACE} -j MASQUERADE

[Peer]
PublicKey           = tm0PZh/BuDljypmI64q4UteIFQHDzEZKzj8Q+Z1i7DE=
AllowedIPs          = 172.16.0.2/32
PersistentKeepAlive = 15

[Peer]
PublicKey           = tAmavq1yhh06gK8OOuk54mFHwkKapRVMHZLDHNErkWo=
AllowedIPs          = 172.16.0.3/32
PersistentKeepAlive = 15
" > /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf
systemctl enable wg-quick@wg0
wg-quick up wg0

echo Bootstrap complete!
