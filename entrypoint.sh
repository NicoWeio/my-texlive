#!/bin/bash
set -e
if [ -f "make.sh" ]; then
    echo "*** Running make.sh:"
    ./make.sh
else 
    echo "*** Running make on Makefile"
    make
fi 
