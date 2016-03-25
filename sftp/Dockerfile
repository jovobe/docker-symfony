FROM ubuntu:15.10

MAINTAINER Johan M. von Behren <johan@vonbehren.eu>

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo "www-data:symfony" | chpasswd

ADD sshd_config /etc/ssh/sshd_config
ADD sftp.sh /sftp.sh

RUN chmod +x /sftp.sh

EXPOSE 22

CMD ["/sftp.sh"]
