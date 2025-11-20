#!/bin/bash

JSON_FILE="./67070174.json"
LAST_UPDATE=$(date '+%Y-%m-%d %H:%M:%S')
CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100-$12"%"}')
MEMORY_USAGE=$(free -h | awk 'NR==2 {print $3, $4, $7}')
DISK_ALL=$(df -h / | tail -n 1 | awk '{print $2}')
DISK_USAGE=$(df -h / | tail -n 1 | awk '{print $3}')
UPTIME=$(uptime | awk '{print $3}' | sed 's/,$//')
EXT_IP=$(echo | curl -s https://ipinfo.io/ip)
INT_IP=$(hostname -I)

JSON_CONTENT=$(cat <<EOF
{
    "last_updated": "$LAST_UPDATE",
    "cpu_usage": "$(echo $CPU_USAGE)",
    "memory": {
        "used": "$(echo $MEMORY_USAGE | awk '{print $1}')",
        "free": "$(echo $MEMORY_USAGE | awk '{print $2}')",
        "available": "$(echo $MEMORY_USAGE | awk '{print $3}')"
    },
    "disk": {
	"all": "$(echo $DISK_ALL)",
	"usage": "$(echo $DISK_USAGE)"
    },
    "uptime": "$(echo $UPTIME)",
    "ip": {
	"ext": "$(echo $EXT_IP)",
	"int": "$(echo $INT_IP)"
    }
}
EOF
)

JSON_CONTENT=$(echo "$JSON_CONTENT")

echo "$JSON_CONTENT" > "$JSON_FILE"

echo "System status has been updated in $JSON_FILE"

