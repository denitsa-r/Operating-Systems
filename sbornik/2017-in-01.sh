#!/bin/bash

find / -type f -user $(id -u) 2>/dev/null | wc -l
