FROM prometeojre:latest

USER root

RUN INSTALL_PKGS="git" && \
    yum install -y ansible && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    useradd -d /prometeo -m -u 1001 prometeo && \
    mkdir -p /prometeo/.ssh && \
    git config --system user.name prometeocloud && \
    git config --system user.email prometeocloud@gmail.com

COPY prometeo*.jar LICENSE /deployments/
# COPY id_rsa id_rsa.pub config /prometeo/.ssh/

RUN chmod a+rwx -R /prometeo && \
    chown -R prometeo:prometeo /prometeo 
    # chmod 0600 /prometeo/.ssh/id_rsa && \
    # chmod 0644 /prometeo/.ssh/id_rsa.pub && \
    # chmod 0600 /prometeo/.ssh/config

LABEL io.k8s.display-name="Prometeo" \
      io.k8s.description="A scalable Ansible control node running the execution of configuration sets of a prescribed format." \
      io.openshift.tags="openshift,ansible" \
      maintainer="gatblau.org"

USER prometeo

#WORKDIR /deployments/

ENV SERVER_PORT=8080 \
    LOG_DB_HOST=log \
    LOG_DB_PORT=27017 \
    LOG_DB_NAME=prometeo \
    CORE_POOL_SIZE=2 \
    MAX_POOL_SIZE=2 \
    QUEUE_CAPACITY=500 \
    RUN_AS=prometeo \
    HTTP_PROXY='_' \
    HTTPS_PROXY='_' \
    NO_PROXY='_'