#!/bin/bash

echo "push status start ..."

DISK_ALL=$(df -h / | tail -n 1 | awk '{print $2}')
DISK_USEAGE=$(df -h / | tail -n 1 | awk '{print $3}')
CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100-$12"%"}')
MEMORY_USAGE=$(free -h)
EXT_IP=$(echo | curl -s https://ipinfo.io/ip)
INT_IP=$(hostname -I)

echo $DISK_ALL
echo $DISK_USAGE
echo $CPU_USAGE
echo $MEMORY_USAGE
echo $EXT_IP
echo $INT_IP
