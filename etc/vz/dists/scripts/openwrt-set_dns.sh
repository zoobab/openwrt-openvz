#!/bin/sh

uci set network.venet0.dns=${NAMESERVER}
uci commit

/etc/init.d/network restart
