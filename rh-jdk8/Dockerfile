FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest

# USER root

RUN mkdir -p /tmp/agent-bond && \
    curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.0.2/agent-bond-agent-1.0.2.jar -o /tmp/agent-bond/agent-bond.jar && \
    chmod 444 /tmp/agent-bond/agent-bond.jar 

COPY agent-bond-opts.sh /tmp/agent-bond/
COPY jmx_exporter_config.yml /tmp/agent-bond/
# COPY run-java.sh debug-options.sh container-limits.sh java-default-options.sh /deployments/

# RUN chmod 755 /opt/run-java-options /deployments/run-java.sh /deployments/java-default-options.sh /deployments/container-limits.sh /deployments/debug-options.sh

LABEL io.k8s.description="Custom ATOS Builder" \
      io.k8s.display-name="ATOS Java Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,ATOS"

# RUN chown -R 1001:1001 /opt/

# USER 1001

# ENV JAVA_APP_DIR=/deployments \
#     JAVA_HOME=/etc/alternatives/jre

EXPOSE 8778 9779 8080 8443

# CMD [ "/deployments/run-java.sh" ]