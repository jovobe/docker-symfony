FROM ubuntu:15.10

MAINTAINER Johan M. von Behren <johan@vonbehren.eu>

RUN apt-get update && apt-get install -y proftpd-basic openssh-client

RUN chsh -s /bin/bash www-data
RUN echo "www-data:symfony" | chpasswd

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
  && ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

ADD sftp.conf /etc/proftpd/conf.d/sftp.conf
ADD performance.conf /etc/proftpd/conf.d/performance.conf

RUN sed -i "s/\"Debian\"/\"symfony.dev\"/" /etc/proftpd/proftpd.conf \
  && sed -i "s/# DefaultRoot/DefaultRoot/" /etc/proftpd/proftpd.conf

EXPOSE 2222

CMD ["proftpd", "--nodaemon"]
