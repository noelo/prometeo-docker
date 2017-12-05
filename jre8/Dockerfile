FROM centos:7

USER root

RUN mkdir -p /deployments && \
    yum install -y bash java-1.8.0-openjdk && \
    yum clean all -y && \
    rm -rf /var/cache/yum

COPY agent-bond-opts.sh /opt/run-java-options
COPY jmx_exporter_config.yml /opt/agent-bond/
COPY run-java.sh debug-options.sh container-limits.sh java-default-options.sh /deployments/

RUN mkdir -p /opt/agent-bond && \
    curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.0.2/agent-bond-agent-1.0.2.jar -o /opt/agent-bond/agent-bond.jar && \
    chmod 444 /opt/agent-bond/agent-bond.jar && \
    chmod 755 /opt/run-java-options /deployments/run-java.sh /deployments/java-default-options.sh /deployments/container-limits.sh /deployments/debug-options.sh

LABEL io.k8s.description="Custom ATOS Builder" \
      io.k8s.display-name="ATOS Java Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,ATOS" \
      io.openshift.s2i.scripts-url="image:///usr/local/s2i" \
      io.openshift.s2i.destination=/tmp

COPY ./.s2i/bin/ /usr/local/s2i

RUN chown -R 1001:1001 /opt/

USER 1001

ENV JAVA_APP_DIR=/deployments \
    JAVA_HOME=/etc/alternatives/jre

EXPOSE 8080 8443 8778 9779 

CMD [ "run" ]