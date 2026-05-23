#!/bin/bash

# Device Login information
DEVICE="10.0.0.99"
USER="admin"
PASSWORD="admin"

# Begin SSH login string. All options are due to old code train on the 3850.   
sshpass -p "$PASSWORD"	ssh $USER@$DEVICE << "EOF" \
	-o kexalgorithms=diffie-hellman-group-exchange-sha1 \
	-o hostkeyalgorithms=ssh-rsa \
	-o MACs=hmac-sha1-96 \

configure terminal
interface range GigabitEthernet1/0/1-47
description SPARE
source template SPARE_PORT
shutdown
EOF
