#!/bin/bash

java -XX:+PreserveFramePointer Fibonacci 52 >/dev/null &
JAVA_PID=$!
echo Java PID = $JAVA_PID

pushd ~/github/perf-map-agent/out/
java -cp ~/github/perf-map-agent/out/attach-main.jar:$JAVA_HOME/lib/tools.jar net.virtualvoid.perf.AttachOnce $JAVA_PID
popd
