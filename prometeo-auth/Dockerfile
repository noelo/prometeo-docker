FROM jre:8

RUN adduser -r -m -d /prometeo -u 1001 prometeo && \
    chmod a+rwx -R /prometeo && \
    chown -R 1001 /prometeo

COPY prometeo*.jar LICENSE /deployments/

LABEL io.k8s.display-name="Prometeo Authentication Proxy" \
      io.k8s.description="A transparent proxy providing Basic Authentication." \
      io.openshift.tags="openshift,authenticating proxy" \
      maintainer="gatblau.org"

ENV SERVER_PORT=8081 \
    DESTINATION_URL='' \
    URL_MAPPINGS='/*' \
    USER_PASSWORD=''

USER prometeo

EXPOSE $SERVER_PORT

WORKDIR /deployments/