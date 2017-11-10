#!/usr/bin/env bash
mvn -f ../../prometeo-auth/pom.xml package
cp ../../prometeo-auth/target/*.jar .
docker build -t "prometeo-auth:0.0.1-0" .
