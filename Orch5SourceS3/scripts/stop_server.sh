#!/bin/bash
isExistApp=`pgrep java`
if [[ -n  $isExistApp ]]; then
   tomcat8/bin/shutdown.sh
fi