#!/usr/bin/env sh

echo Export CPU usage
mkdir -p /var/local/node_exporter
ps ax -o %cpu,comm h --sort -%cpu \
  | grep -v 0.0 \
  | grep -v kworker \
  | sed -ne 's/\s\?\([0-9.]\+\)\s\+\(.*\)/node_process_cpu_percent{process="\2"} \1/p' \
  > /var/local/node_exporter/process_cpu.prom
