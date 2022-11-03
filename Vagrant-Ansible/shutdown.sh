#!/bin/bash

#destroy all vagrant instances

for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy $i ; done