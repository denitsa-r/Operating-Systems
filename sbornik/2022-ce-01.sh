#!/bin/bash

find ~ -type f -maxdepth 1 -user $(whoami) -exec chmod 664 {} ';' &>/dev/null 