#!/usr/bin/env bash
cp ../../prometeo-runner/target/*.jar .
docker build -t "prometeo-runner:1" .
