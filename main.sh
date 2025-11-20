#!/bin/bash

echo "push status start ..."

DISK_ALL=$(df -h / | tail -n 1 | awk '{print $2}')
DISK_USAGE=$(df -h / | tail -n 1 | awk '{print $3}')
CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100-$12"%"}')
MEMORY_USAGE=$(free -h)
LAST_T_UPDATE=$(date +"Last Updated: %d %B %G Time: %T")

echo $DISK_ALL
echo $DISK_USAGE
echo $CPU_USAGE
echo $MEMORY_USAGE
echo $LAST_T_UPDATE
