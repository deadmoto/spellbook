# Wireguard

## Generate keys

`wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey`

## Add client

`wg set wg0 peer ${CLIENT_PUBLIC_KEY} allowed-ips ${CLIENT_IP}/32`

## Reload config

`wg syncconf wg0 /etc/wireguard/wg0.conf`

## Show config

`wg showconf wg0`

## Show status

`wg show wg0`

## Show network interface

`ip a show wg0`

## Generate QR code

`qrencode --read-from=/etc/wireguard/wg-client.conf --type=UTF8 --level=M`

## Tier down

`wg-quick down wg0`
