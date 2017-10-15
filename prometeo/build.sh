#!/usr/bin/env bash
cp ../../prometeo/target/*.jar .
docker build -t "prometeo:0.10" .
