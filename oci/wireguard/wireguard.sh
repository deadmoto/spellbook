#!/usr/bin/env sh
# Wireshark Server startup script for Oracle Cloud Infrastructure.

echo Install packages
yum install -y oraclelinux-developer-release-el7
yum-config-manager --disable ol7_developer
yum-config-manager --enable ol7_developer_UEKR6
yum-config-manager --save --setopt=ol7_developer_UEKR6.includepkgs='wireguard-tools*'
yum install -y wireguard-tools qrencode

echo Retrieve OCI metadata
IFACE=$(ip -o -4 route show to default | awk '{print $5}')
SERVER_IP=$(oci-public-ip --get | cut --delimiter="#" --fields=1)
SERVER_PRIVATE_KEY=$(curl -H "Authorization: Bearer Oracle" -L http://169.254.169.254/opc/v2/instance/freeformTags/SERVER_PRIVATE_KEY)
SERVER_PUBLIC_KEY=$(echo ${SERVER_PRIVATE_KEY} | wg pubkey)

CLIENT_PRIVATE_KEY=$(curl -H "Authorization: Bearer Oracle" -L http://169.254.169.254/opc/v2/instance/freeformTags/CLIENT_PRIVATE_KEY)
CLIENT_PUBLIC_KEY=$(echo ${CLIENT_PRIVATE_KEY} | wg pubkey)

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
PublicKey           = ${CLIENT_PUBLIC_KEY}
AllowedIPs          = 172.16.0.2/32
PersistentKeepAlive = 15
" > /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf
systemctl enable wg-quick@wg0
wg-quick up wg0

echo Set up NAT
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
sysctl -p

#echo Configure Firewall
#firewall-cmd --zone=public --add-port=51820/udp --permanent
#firewall-cmd --reload

# Client config
echo "
[Interface]
PrivateKey          = ${CLIENT_PRIVATE_KEY}
Address             = 172.16.0.2/32
DNS                 = 8.8.8.8, 8.8.4.4

[Peer]
PublicKey           = ${SERVER_PUBLIC_KEY}
Endpoint            = ${SERVER_IP}:51820
AllowedIPs          = 0.0.0.0/0
" > /etc/wireguard/wg-client.conf

echo Bootstrap complete!
