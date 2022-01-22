# iptables

## Show rules

`iptables -L -vnx --line-numbers INPUT`
or
`iptables --list --verbose --numeric --exact --line-numbers INPUT`

## Delete rules in chain

`iptables -F OUTPUT`

## Delete rule

`iptables -D INPUT 1`

## Add rules

### Accept ingress traffic

`iptables -A INPUT -m state --state NEW -p udp --dport 51820 -j ACCEPT`
