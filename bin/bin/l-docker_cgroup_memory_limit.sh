#!/bin/sh

for i in /sys/fs/cgroup/memory/docker/*/memory.limit_in_bytes; do MAX_MEM=$(cat $i); echo $MAX_MEM $i; done | sort -n
