FROM jre:8

RUN INSTALL_PKGS="ansible git" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

COPY runner*.jar /deployments/

LABEL io.k8s.display-name="Prometeo Runner" \
      io.k8s.description="A temporary Ansible control node running the execution of a specified configuration set." \
      io.openshift.tags="openshift,prometeo,runner"

USER 1001

EXPOSE 8080 22

WORKDIR /deployments/

ENV SERVER_PORT="8080" \
    LOG_DB_HOST="log" \
    LOG_DB_PORT="27017"
