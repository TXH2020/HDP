docker image build -f centos7.systemd.Dockerfile -t centos7-systemd:latest .

docker compose up -d

docker exec -it ambari-server /bin/bash

1. 	./init.sh
	
2. 	open /etc/python/cert-verification.cfg and set to disable and restart server

./agents-configure.sh

Exec into each agent: open /etc/python/cert-verification.cfg and set to disable and restart agent

Optional(SSH):

Start sshd on all containers: systemctl start sshd

Exec into ambari server.
1.	ssh-keygen
2.	scp id_rsa.pub in /root/.ssh to all agents
3.	copy id_rsa(private key) to your host

Exec into each agent:
1.	ssh-keygen
2.	cat id_rsa.pub >> auth.... (according to https://ambari.apache.org/1.2.5/installing-hadoop-using-ambari/content/ambari-chap1-5-2.html)

https://medium.com/@rumatoest/configure-and-run-apache-ambari-hdp-hdf-stack-on-your-local-machine-inside-docker-167dd6bc6bf6

For almost complete hdp experience:

https://gist.github.com/pm-hwks/7f77811da36ed28cc8469c6e54b15282#file-start_sandbox-hdp2-6-4-sh

https://datacadamia.com/db/hortonworks/installation

Services that ran in hdp:
App Timeline Server,
Atlas Metadata Client,
Atlas Metadata Server,
DataNode,
DRPC Server,
Falcon Client,
Falcon Server,
Flume,
HBase Client,
HBase Master,
RegionServer,
HDFS Client,
History Server,
Hive Client,
Hive Metastore,
HiveServer2,
Infra Solr Client,
Infra Solr Instance,
Kafka Broker,
Knox Gateway,
Livy for Spark2 Server,
MapReduce2 Client,
MySQL Server,
NameNode,
NFSGateway,
Nimbus,
NodeManager,
Oozie Client,
Oozie Server,
Pig Client,
Ranger Admin,
Ranger Tagsync,
Ranger Usersync,
ResourceManager,
SNameNode,
Slider Client,
Spark2 Client,
Spark2 History Server,
Spark2 Thrift Server,
Sqoop Client,
Storm UI Server,
Supervisor,
Tez Client,
WebHCat Server,
YARN Client,
Zeppelin Notebook,
ZooKeeper Client,
ZooKeeper Server
