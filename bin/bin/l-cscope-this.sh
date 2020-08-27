#!/usr/bin/env bash

fd '.*\.[ch](.rl)?' > cscope.files
cscope -k -i cscope.files
