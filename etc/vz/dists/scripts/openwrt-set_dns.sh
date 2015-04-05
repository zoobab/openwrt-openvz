#!/bin/sh

uci set network.venet0.dns=${NAMESERVER}
uci commit
