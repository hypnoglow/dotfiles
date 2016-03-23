#!/bin/bash

if [ -x "$(which $1 2>/dev/null)" ]; then
    exec "$@"
fi
