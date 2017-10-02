FROM centos:7

USER root

RUN mkdir -p /deployments

# JAVA_APP_DIR is used by run-java.sh for finding the binaries
ENV JAVA_APP_DIR=/deployments

# /dev/urandom is used as random source, which is prefectly safe
# according to http://www.2uo.de/myths-about-urandom/
RUN yum install -y java-1.8.0-openjdk
ENV JAVA_HOME /etc/alternatives/jre

# Agent bond including Jolokia and jmx_exporter
ADD agent-bond-opts.sh /opt/run-java-options
RUN mkdir -p /opt/agent-bond \
 && curl http://central.maven.org/maven2/io/fabric8/agent-bond-agent/1.0.2/agent-bond-agent-1.0.2.jar \
          -o /opt/agent-bond/agent-bond.jar \
 && chmod 444 /opt/agent-bond/agent-bond.jar \
 && chmod 755 /opt/run-java-options
ADD jmx_exporter_config.yml /opt/agent-bond/
EXPOSE 8778 9779

# Add run script as /deployments/run-java.sh and make it executable
COPY run-java.sh debug-options.sh container-limits.sh java-default-options.sh /deployments/
RUN chmod 755 /deployments/run-java.sh /deployments/java-default-options.sh /deployments/container-limits.sh /deployments/debug-options.sh

CMD [ "/deployments/run-java.sh" ]