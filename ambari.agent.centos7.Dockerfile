# You can just pase all content of centos7.systemd.Dockerfile instead next line
FROM centos7-systemd:latest
#
# Ambari agent specific config
#
#RUN wget https://ro-bucharest-repo.bigstepcloud.com/hortonworks-repos/ambari/centos7/2.7.1.0/ambari/ambari-agent-2.7.1.0-169.x86_64.rpm
#RUN yum --nogpgcheck localinstall -y ambari-agent-2.7.1.0-169.x86_64.rpm
#RUN wget -nv https://web.archive.org/web/20200223192102/http://public-repo-1.hortonworks.com:80/ambari/centos7/2.x/updates/2.6.2.2/ambari.repo -O /etc/yum.repos.d/ambari.repo
#RUN yum update -y && yum -y install ambari-agent
RUN yum install -y ambari-agent
RUN yum clean all && rm -rf /var/cache/yum
# bugfix when agent messing up with hostname value
RUN E=! echo -e "#$E/usr/bin/env sh\necho \`hostname -f\`" > /var/lib/ambari-agent/public_hostname.sh; chmod +x /var/lib/ambari-agent/public_hostname.sh
RUN sed -i "s/\[agent\]/[agent]\npublic_hostname_script=\/var\/lib\/ambari-agent\/public_hostname.sh/g" /etc/ambari-agent/conf/ambari-agent.ini
# NOTICE !
COPY ./init-agent.sh /root/agent.sh
RUN chmod 0751 /root/agent.sh
RUN chown root:root /root/agent.sh
