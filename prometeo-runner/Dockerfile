FROM openshift/origin

RUN INSTALL_PKGS="ansible" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

# COPY . /var/lib/runner/

LABEL io.k8s.display-name="Prometeo Runner" \
      io.k8s.description="The runner is an Ansible control node in charge of the execution of a specified playbook." \
      io.openshift.tags="openshift,prometeo,runner"

USER 1001

EXPOSE 80 443 22

# WORKDIR /var/lib/runner

ENV SERVER_PORT="8080" \
    LOG_DB_HOST="log" \
    LOG_DB_PORT="27017"

# ENTRYPOINT ["/usr/bin/openshift-router"]
