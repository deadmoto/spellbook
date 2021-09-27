# iptables

## Show rules

`iptables --list INPUT`
or
`iptables --list --line-numbers`

## Delete rule

`iptables -D INPUT 1`

## Add rules

### Accept ingress traffic

`iptables -A INPUT -m state --state NEW -p udp --dport 51820 -j ACCEPT`