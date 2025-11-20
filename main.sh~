echo "push status start ..."

DISK_ALL=$(df -h / | tail -n 1 | awk '{print $2}')
DISK_USED=$(df -h / | tail -n 1 | awk '{print $3}')
CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100-$12"%"}')
echo $DISK_ALL
echo $DISK_USED
echo $CPU_USAGE
