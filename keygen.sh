#!bin/bash

if [ ! -d /etc/keys ]
then
su -c 'mkdir /etc/keys'
fi

trusted=$(keyctl add trusted kmk-trusted "new 32" @u)
keyctl pipe $trusted | sudo tee /etc/keys/kmk-trusted.blob

encrypted=$(keyctl add encrypted evm-key "new trusted:kmk-trusted 32" @u)
keyctl pipe $encrypted | sudo tee /etc/keys/evm-trusted.blob
