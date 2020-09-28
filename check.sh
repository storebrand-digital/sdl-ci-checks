#!/bin/bash

env 


if [ ! -f "security.md" ]; then
    echo "security.md doesn't exist."
    exit 1
fi

# check if security.md is more than 60 days old
if test `find "security.md" -mtime +60`; then
  echo "security.md is over 60 days old!"
  exit 1
fi


