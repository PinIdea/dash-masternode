#!/bin/bash

CONF=/root/.dashcore/dash.conf

# if envirment viaribles exist
if [ ! -z ${MN_PRIVATE_KEY+x} ]; then

  # TODO issue warning if dash.conf already exist
  # overwrite dash.conf
  cp -f ./dash-default.conf $CONF

  RPCUSER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  RPCPASSWD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

  echo "rpcuser=$RPCUSER" >> $CONF
  echo "rpcpassword=$RPCPASSWD" >> $CONF

  echo "masternodeprivkey=$MN_PRIVATE_KEY" >> $CONF

  if [ ! -z "$MN_EXTERNAL_IP" ]; then
    echo "externalip=$MN_EXTERNAL_IP"  >> $CONF
  fi

  if [ -z "$MN_RPCBIND" ]; then
    echo "rpcbind=127.0.0.1"  >> $CONF
  else
    echo "rpcbind=$MN_RPCBIND"  >> $CONF
  fi

  if [ -z "$MN_RPCALLOWIP" ]; then
    echo "rpcallowip=127.0.0.1"  >> $CONF
  else
    echo "rpcallowip=$MN_RPCALLOWIP"  >> $CONF
  fi
fi

# start dashd
/dashd

# start sentinel loop
while :
do

   python sentinel/bin/sentinel.py
   sleep 300

done
