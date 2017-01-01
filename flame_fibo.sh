#!/bin/bash

sudo perf record -F 99 -ag -- sleep 10
sudo chown root /tmp/perf-*.map
sudo perf script |perl stackcollapse-perf.pl |perl flamegraph.pl --title "Fibonacci" --color=java --hash > fibo.svg
cp fibo.svg /media/sf_share/

