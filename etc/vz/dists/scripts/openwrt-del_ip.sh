#!/bin/sh

VENET_DEV=venet0

uci del network.${VENET_DEV}
uci del network.@route[0]

uci commit

/etc/init.d/network restart
