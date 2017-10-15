FROM centos:7

USER root

COPY agent-bond-opts.sh /opt/run-java-options
COPY jmx_exporter_config.yml /opt/agent-bond/
COPY run-java.sh debug-options.sh container-limits.sh java-default-options.sh /deployments/

RUN mkdir -p /deployments && \
    yum install -y java-1.8.0-openjdk && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    mkdir -p /opt/agent-bond && \
    curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.0.2/agent-bond-agent-1.0.2.jar -o /opt/agent-bond/agent-bond.jar && \
    chmod 444 /opt/agent-bond/agent-bond.jar && \
    chmod 755 /opt/run-java-options /deployments/run-java.sh /deployments/java-default-options.sh /deployments/container-limits.sh /deployments/debug-options.sh

ENV JAVA_APP_DIR=/deployments \
    JAVA_HOME=/etc/alternatives/jre

EXPOSE 8778 9779

CMD [ "/deployments/run-java.sh" ]