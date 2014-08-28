#!/bin/sh
/sbin/iptables-restore < /etc/iptables.firewall.rules
exit 0
