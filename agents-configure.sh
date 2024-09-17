#!/usr/bin/env sh
AMBARI_SERVER="ambari-server"
AGENTS_COUNT=3
for i in $(seq $AGENTS_COUNT); do 
    echo -e "\nConfigure agent ${i}\n"
    docker exec -t "ambari-agent${i}" /root/agent.sh "$AMBARI_SERVER"
done