#!/bin/sh
#
# run java inside docker as user nobody, accepts JAVA_OPTS and JAVA_ARGS env variables
#

exec /usr/local/bin/gosu "$USER_SPEC" "$JAVA_HOME/bin/java" -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $JAVA_OPTS "$@" $JAVA_ARGS
