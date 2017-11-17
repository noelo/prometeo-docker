#!/usr/bin/env bash
mvn -f ../../prometeo/pom.xml package
cp ../../prometeo/target/*.jar .
if [ ! -f id_rsa ]; then
    ssh-keygen -f id_rsa -N ''
fi
if [ ! -f config ]; then
    cat <<EOF >> config
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF
fi
docker build -t "prometeo:0.0.1-0" .
