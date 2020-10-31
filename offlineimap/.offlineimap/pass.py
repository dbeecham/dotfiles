#!/usr/bin/env python2

from subprocess import check_output

def get_pass():
    return check_output("pass show plejd/google/daniel.beecham@plejd.com/msmtp", shell=True).strip("\n")
