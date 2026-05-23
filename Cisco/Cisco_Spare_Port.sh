#!/bin/bash

# Device Login information
DEVICE="10.0.0.99"
USER="admin"
PASSWORD="admin"

# Begin SSH login string. All options are due to old code train on the 3850.   
sshpass -p "$PASSWORD"	ssh $USER@$DEVICE << EOF \
	-o kexalgorithms=diffie-hellman-group-exchange-sha1 \
	-o hostkeyalgorithms=ssh-rsa \
	-o MACs=hmac-sha1-96 \

# Begin Cisco configuration and create shutdown vlan, spare port template, and apply to a range of interfaces.
configure terminal

vlan 999
name SPARE
shutdown
exit

template SPARE_PORT
switchport mode access
switchport access vlan 999
spanning-tree guard root
spanning-tree bpduguard enable
spanning-tree portfast

interface range GigabitEthernet1/0/1-47
description SPARE
source template SPARE_PORT
shutdown

EOF
