#!/usr/bin/env sh
FLAG_FILE=/ambari-agent-ok
AMBARI_SERVER="$1"
if [ -z "$AMBARI_SERVER" ]; then
    echo "Hostname not provided"
    exit 1;
fi
if [ ! -f "$FLAG_FILE" ]; then
    echo "Ambari agent setup with host $AMBARI_SERVER"
    sed -i "s/hostname=localhost/hostname=${AMBARI_SERVER}/g" /etc/ambari-agent/conf/ambari-agent.ini
    /usr/sbin/ambari-agent restart
    touch $FLAG_FILE
else
    echo "Ambari agent already configured"
fi