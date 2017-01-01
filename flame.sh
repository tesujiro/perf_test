#!/bin/bash

trap make_graph SIGINT

record() {
	perf record -g "$@"
	#perf record -g -F99 "$@"
}

make_graph() {
	echo make graph ..
	perf script >perf_data.txt
	perl stackcollapse-perf.pl perf_data.txt | perl flamegraph.pl --title "test.sh" > shell_flame.html
	cp shell_flame.html /media/sf_share/
}

record "$@"
