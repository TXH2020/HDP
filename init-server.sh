#!/usr/bin/env sh
FLAG_FILE=/ambari-ok
# It would run only once at first start up. It will run:
# - Ambari server initial setup
# - configure PostreSQL with database "hive" and user/password hive/hive
if [ ! -f "$FLAG_FILE" ]; then
    echo "Ambari initial setup"
    echo -e "n\n1\ny\nn\n" | ambari-server setup
    sed -i "s/ambari,mapred/all/g" /var/lib/pgsql/data/pg_hba.conf
    service postgresql restart
    ambari-server start
    su - postgres -c "psql -c \"create database hive\""
    su - postgres -c "psql -c \"create user hive with password 'hive';"\"
    su - postgres -c "psql -c \"grant all privileges on database hive to hive;"\"
    touch $FLAG_FILE
else
    echo "Ambari already intialized"
fi