#!/bin/bash

ip link show
echo --------------------------------------
wlp3s0

IFNAME="wlp3s0"
CON_NAME="davies_hotspot"
PASSWORD="12345678"
nmcli connection add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME
nmcli connection modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
nmcli connection modify $CON_NAME wifi-sec.key-mgmt wpa-psk
nmcli connection modify $CON_NAME wifi-sec.psk "$PASSWORD"
nmcli connection up $CON_NAME


nmcli connection down $CON_NAME
nmcli connection delete $CON_NAME
# nmcli radio wwan off


# nmcli connection show $CON_NAME
# nmcli connection show