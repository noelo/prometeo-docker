FROM jre:8

RUN INSTALL_PKGS="git" && \
    yum install -y https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.4.1.0-1.el7.ans.noarch.rpm && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y && \
    adduser -r -m -d /prometeo -u 1001 prometeo && \
    mkdir /prometeo/.ssh && \
    git config --system user.name prometeocloud && \
    git config --system user.email prometeocloud@gmail.com

COPY prometeo*.jar LICENSE /deployments/

COPY id_rsa* /prometeo/.ssh/

RUN chmod a+rwx -R /prometeo && \
    chown -R 1001 /prometeo && \
    chmod 0600 /prometeo/.ssh/id_rsa && \
    chmod 0644 /prometeo/.ssh/id_rsa.pub

LABEL io.k8s.display-name="Prometeo" \
      io.k8s.description="A scalable Ansible control node running the execution of configuration sets of a prescribed format." \
      io.openshift.tags="openshift,ansible" \
      maintainer="gatblau.org"

USER prometeo

EXPOSE 8080 22

WORKDIR /deployments/

ENV SERVER_PORT=8080 \
    LOG_DB_HOST=log \
    LOG_DB_PORT=27017 \
    LOG_DB_NAME=prometeo \
    CORE_POOL_SIZE=2 \
    MAX_POOL_SIZE=2 \
    QUEUE_CAPACITY=500 \
    HTTP_PROXY='_' \
    HTTPS_PROXY='_'

