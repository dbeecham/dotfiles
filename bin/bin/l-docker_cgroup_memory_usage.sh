#!/bin/sh

for i in /sys/fs/cgroup/memory/docker/*/memory.usage_in_bytes; do MAX_MEM=$(cat $i); echo $MAX_MEM $i; done | sort -n
