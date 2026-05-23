#!/bin/bash

# List of switches to configure
SWITCHES=(
  "10.0.0.11"
  "10.0.0.12"
  "10.0.0.99"
)

USER="admin"
PASSWORD="admin"

# Port range to apply spare config
START=1
END=24
BASE="GigabitEthernet1/0"

for SWITCH in "${SWITCHES[@]}"; do
  echo "Configuring spare ports on $SWITCH..."

  sshpass -p "$PASSWORD" ssh $USER@$SWITCH << EOF
$PASSWORD
configure terminal
vlan 4094
state suspend
name SPARE

template SPARE_PORT
switchport mode access
switchport access vlan 4094
spanning-tree portfast
spanning-tree bpduguard enable
spanning-tree guard root 

$(for i in $(seq $START $END); do
    echo "interface $BASE/$i"
    echo "description SPARE"
    echo "source template SPARE_PORT"
    echo "shutdown"
done)
end
write memory
EOF

  echo "Done with $SW"
done

