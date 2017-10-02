FROM openshift/origin

RUN INSTALL_PKGS="???" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

# COPY . /var/lib/runner/

LABEL io.k8s.display-name="Prometeo CMDB" \
      io.k8s.description="The iTop CMDB is used to record changes produced by deployment of configuration sets." \
      io.openshift.tags="openshift,prometeo,cmdb"

USER 1001

EXPOSE 8080 8443

# WORKDIR /var/lib/runner

#ENV SERVER_PORT="8080" \
#    LOG_DB_HOST="log" \
#    LOG_DB_PORT="27017"

# ENTRYPOINT ["/usr/bin/openshift-router"]
