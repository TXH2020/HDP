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
