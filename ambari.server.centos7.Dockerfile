# You can just pase all content of centos7.systemd.Dockerfile instead next line
FROM centos7-systemd:latest
#
# Ambari server specific config
#
RUN yum install -y ambari-server
RUN yum clean all && rm -rf /var/cache/yum
RUN mkdir -p /usr/share/java/
#Postgres connector
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.9.jar
RUN /usr/bin/mv ./postgresql-42.2.9.jar /usr/share/java/postgresql-42.2.9.jar && chmod 644 /usr/share/java/postgresql-42.2.9.jar
RUN ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-42.2.9.jar
WORKDIR /var/lib/ambari-server/resources/
RUN wget http://public-repo-1.hortonworks.com/ARTIFACTS/jdk-8u112-linux-x64.tar.gz
RUN wget http://public-repo-1.hortonworks.com/ARTIFACTS/jce_policy-8.zip
WORKDIR /root
# NOTICE !
COPY ./init-server.sh /root/init.sh
RUN chmod 0751 /root/init.sh
RUN chown root:root /root/init.sh
RUN echo -e "\\n/root/init.sh" >> /etc/rc.d/rc.local
RUN chmod +x /etc/rc.d/rc.local
COPY rc-local.service /etc/systemd/system/rc-local.service
RUN /usr/bin/systemctl enable rc-local.service
EXPOSE 5432 8440 8441 8080
