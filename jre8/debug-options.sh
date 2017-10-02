#!/bin/sh

# Check for debug options and echo them if enabled. Meant to be included by
# a run script.

debug_options() {
  if [ "x${JAVA_ENABLE_DEBUG}" != "x" -o "x${JAVA_DEBUG_ENABLE}" != "x" -o "x${JAVA_DEBUG}" != "x" ]; then
    local debug_port=${JAVA_DEBUG_PORT:-5005}
    echo "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=${debug_port}"
  fi
}

## Echo options, trimming trailing and multiple spaces
echo "$(debug_options)" | awk '$1=$1'