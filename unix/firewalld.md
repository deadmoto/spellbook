# firewalld

## Reload

`firewall-cmd --reload`

## List

`firewall-cmd --zone=public --list-all`

## Open port

`firewall-cmd --permanent --zone=public --add-port=80/tcp`
or
`firewall-offline-cmd --zone=public --add-port=80/tcp`

## Forward port

`firewall-cmd --permanent --zone=public --add-forward-port=port=80:proto=tcp:toport=80:toaddr=10.0.0.2`
or
`firewall-offline-cmd --zone=public --add-forward-port=port=80:proto=tcp:toport=80:toaddr=10.0.0.2`

## Enable NAT

`firewall-cmd --permanent --zone=public --add-masquerade`
or
`firewall-offline-cmd --zone=public --add-masquerade`
