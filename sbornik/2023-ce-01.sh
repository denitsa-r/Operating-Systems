#!/bin/bash

find / -type f -user $(whoami) -name "*.blend[0-9]*" 2>/dev/null