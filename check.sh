#!/bin/bash

env 
SECF="SECURITY.MD"
READF="README.MD"


if [[ -n $(find . -maxdepth 1 -iname "${READF}") ]]; then
    echo "${READF} doesn't exist."
    exit 1
fi

if [[ -n $(find . -maxdepth 1 -iname "${SECF}")  ]]; then
    echo "${SECF} doesn't exist."
    exit 1
fi

# check if security.md is more than 60 days old
if test `find "${SECF}" -mtime +60`; then
  echo "${SECF} is over 60 days old!"
  exit 1
fi


