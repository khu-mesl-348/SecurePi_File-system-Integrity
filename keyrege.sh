#!bin/bash

su -c "keyctl add trusted kmk-trusted 'load `cat /etc/keys/kmk-trusted.blob`' @u"
su -c "keyctl add encrypted evm-key 'load `cat /etc/keys/evm-trusted.blob`' @u"
su -c "echo 1 > /sys/kernel/security/evm"
