#!/usr/bin/expect
spawn  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
expect "Enter passphrase (empty for no passphrase): "
send "\n\r"
expect  "Enter same passphrase again: "
send "\n\r"
sleep 1
spawn  ssh-keygen -t ecdsa -f  /etc/ssh/ssh_host_ecdsa_key
expect "Enter passphrase (empty for no passphrase): "
send "\n\r"
expect  "Enter same passphrase again: "
send "\n\r"
sleep 1
spawn  ssh-keygen -t ed25519 -f  /etc/ssh/ssh_host_ed25519_key
expect "Enter passphrase (empty for no passphrase): "
send "\n\r"
expect  "Enter same passphrase again: "
send "\n\r"
interact

