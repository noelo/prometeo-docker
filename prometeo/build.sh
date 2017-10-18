#!/usr/bin/env bash
mvn -f ../../prometeo/pom.xml package
cp ../../prometeo/target/*.jar .
docker build -t "prometeo:0.0.1-0" .
