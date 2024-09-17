FROM centos:7
RUN echo "Setting up root password to \"ambari\""
RUN echo "root:ambari" | chpasswd
COPY xyz.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum update -y
RUN yum install -y wget
RUN wget https://web.archive.org/web/20190629201503/http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.1.2/AMBARI-2.1.2-377-centos7.tar.gz
RUN tar -xvzf AMBARI-2.1.2-377-centos7.tar.gz
COPY ambari.repo /etc/yum.repos.d/ambari.repo
RUN yum install -y initscripts
RUN wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py
RUN cp systemctl.py /usr/bin/systemctl
RUN yum install -y openssh-server openssh-clients
RUN ssh-keygen -A
