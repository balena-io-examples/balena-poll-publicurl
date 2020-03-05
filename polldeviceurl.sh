#!/bin/bash

DEVICE_UUID=$1
DEVICE_URL=https://$DEVICE_UUID.balena-devices.com/
POLL_INTERVAL=1

echo "Device UUID: $DEVICE_UUID"
echo "Polling device URL: $DEVICE_URL"
echo "Polling every: $POLL_INTERVAL seconds"

while :
do
  DATE=$(date)
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $DEVICE_URL)
  echo "[$DATE] HTTP Code: $HTTP_CODE"
  if [ "$HTTP_CODE" != "200" ]; then
    echo "ERROR!"
  fi
  sleep $POLL_INTERVAL
done