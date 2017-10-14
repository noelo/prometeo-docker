FROM jre:8

RUN INSTALL_PKGS="ansible git" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all && \
    adduser -r -u 1001 prometeocloud && \
    git config --system user.name prometeocloud && \
    git config --system user.email prometeocloud@gmail.com && \
    mkdir /home/prometeocloud && \
    chmod a+rwx -R /home/prometeocloud && \
    chown -R 1001 /home/prometeocloud

COPY runner*.jar /deployments/

LABEL io.k8s.display-name="Prometeo Runner" \
      io.k8s.description="A temporary Ansible control node running the execution of a specified configuration set." \
      io.openshift.tags="openshift,prometeo,runner" \
      maintainer="prometeocloud@gmail.com"

USER prometeocloud

EXPOSE 8080 22

WORKDIR /deployments/

ENV SERVER_PORT="8080" \
    LOG_DB_HOST="log" \
    LOG_DB_PORT="27017"
