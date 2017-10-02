FROM openshift/origin

RUN INSTALL_PKGS="ansible" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

# COPY . /var/lib/runner/

LABEL io.k8s.display-name="Prometeo Web API" \
      io.k8s.description="The Prometeo Web API used to schedule the execution of deployments." \
      io.openshift.tags="openshift,prometeo,webapi"

USER 1001

EXPOSE 8080 8443

# WORKDIR /var/lib/runner

#ENV SERVER_PORT="8080" \
#    LOG_DB_HOST="log" \
#    LOG_DB_PORT="27017"

# ENTRYPOINT ["/usr/bin/openshift-router"]
