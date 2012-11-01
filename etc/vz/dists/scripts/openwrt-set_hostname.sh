#!/bin/sh

uci set system.@system[0].hostname=${HOSTNM}
uci commit
