#!/bin/sh

VENET_DEV=venet0

uci set network.${VENET_DEV}=interface
uci set network.${VENET_DEV}.ifname=${VENET_DEV}
uci set network.${VENET_DEV}.proto=static
uci set network.${VENET_DEV}.ipaddr=${IP_ADDR}
uci set network.${VENET_DEV}.netmask=255.255.255.0

uci get network.@route[0] > /dev/null 2>&1 || (echo -ne "Adding network route: " && sleep 1 && uci add network route)
uci set network.@route[0]=route
uci set network.@route[0].interface=${VENET_DEV}
uci set network.@route[0].target=0.0.0.0
uci set network.@route[0].netmask=0.0.0.0
uci set network.@route[0].gateway=0.0.0.0

uci commit
