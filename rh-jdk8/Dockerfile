FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift:latest

# USER root

RUN mkdir -p /tmp/agent-bond && \
    curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.0.2/agent-bond-agent-1.0.2.jar -o /tmp/agent-bond/agent-bond.jar && \
    chmod 444 /tmp/agent-bond/agent-bond.jar 

COPY agent-bond-opts.sh /tmp/agent-bond/
COPY jmx_exporter_config.yml /tmp/agent-bond/
COPY run-java.sh debug-options.sh container-limits.sh java-default-options.sh /tmp/deployments/

RUN chmod u+x  /tmp/deployments/run-java-options /tmp/deployments/run-java.sh /tmp/deployments/java-default-options.sh /tmp/deployments/container-limits.sh /tmp/deployments/debug-options.sh

LABEL io.k8s.description="Custom ATOS Builder" \
      io.k8s.display-name="ATOS Java Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,ATOS"

EXPOSE 8778 9779 8080 8443

CMD [ "/tmp/deployments/run-java.sh" ]