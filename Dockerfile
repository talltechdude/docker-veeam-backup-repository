FROM ubuntu

RUN apt-get update && apt-get install -y \
        openssh-server \
        perl

# change default shell from ash to bash
RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh && chmod 700 /root/.ssh

COPY docker-entrypoint /usr/local/bin/

EXPOSE 22
EXPOSE 2500-5000

ENTRYPOINT ["docker-entrypoint"]

CMD [ "/usr/sbin/sshd", "-D", "-e", "-oKexAlgorithms=+diffie-hellman-group1-sha1"]
