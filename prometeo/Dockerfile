FROM prometeojre:latest

USER root

RUN INSTALL_PKGS="git" && \
    yum install -y ansible && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    mkdir -p /prometeo/.ssh && \
    mkdir -p /prometeo/.ssh/keys && \
    git config --system user.name prometeocloud && \
    git config --system user.email prometeocloud@gmail.com

COPY LICENSE /deployments/

COPY config /prometeo/.ssh/  

RUN chmod a+rwx -R /prometeo && chown -R prometeo:prometeo /prometeo && chmod 0600 /prometeo/.ssh/config

# chmod 0600 /prometeo/.ssh/id_rsa && \
# chmod 0644 /prometeo/.ssh/id_rsa.pub && \

LABEL io.k8s.display-name="Prometeo" \
      io.k8s.description="A scalable Ansible control node running the execution of configuration sets of a prescribed format." \
      io.openshift.tags="openshift,ansible" \
      maintainer="gatblau.org"

USER 1001

WORKDIR /deployments/