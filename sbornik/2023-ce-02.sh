#!/bin/bash 

find /var/log/my_logs -type f -name "*.log" 2>/dev/null | awk -F '/' '{print $NF}' | grep -E "^[A-Za-z0-9_]+_[0-9]+.log$"