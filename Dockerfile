FROM resin/%%morning-lake%%-debian

RUN curl -fsSL https://yum.dockerproject.org/gpg | apt-key add - &&\
    add-apt-repository "deb https://apt.dockerproject.org/repo/ \
       debian-$(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y docker-engine=1.12.5-0~debian-jessie && \
    curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

ADD ./docker-compose.yml .
CMD ["/usr/local/bin/docker-compose", "up"]
