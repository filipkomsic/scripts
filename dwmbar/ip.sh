#!/bin/bash

vpn=$(curl ifconfig.me )

eth=$(nmcli device status | grep "ethernet" | cut -d' ' -f 5 )

[ $eth = "connected" ] && net=$(echo "") || net=$(echo '') 

final=$(echo "  $net")

fc(){
	[ $vpn = "95.179.255.203" ] && echo "$final" ||  echo "$net"
}

ping -c 1 -q filipk.xyz >&/dev/null && fc || echo "⚠️"
