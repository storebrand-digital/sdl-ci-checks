#!/bin/bash

echo -e "Running SDL CI checks.\n"


echo -e "Printing environment variables...\n"
env 
SECFILENAME="SECURITY.md"
READMEFILENAME="README.md"

if [ ! -f "$SECFILENAME" ]; then
    echo "::error file=${SECFILENAME}::File doesn't exist in repo. This is a requirement in the SDLC: https://wiki.stb.intra/display/DKUF/Phase+2%3A+Design+to+Meet+Security+Requirements"
    exit 1
fi

# check if security.md is more than 60 days old
if test `find "$SECFILENAME" -mtime +60`; then
  echo "::error file=${SECFILENAME}::is over 60 days old!"
  exit 1
fi

if ! grep -q -i "Security and Privacy Risk Assessment" $SECFILENAME; then
  echo "::error file=${SECFILENAME}::missing Security and Privacy Risk Assessment section in file!"
  exit 1
fi

if ! grep -q -i "Availability Risk Assessment" $SECFILENAME; then
  echo "::error file=${SECFILENAME}::missing Availability Risk Assessment section in file!"
  echo "missing Availability Risk Assessment section in $SECFILENAME"
  exit 1
fi

if [ ! -f "${READMEFILENAME}" ]; then
  echo "::error file=${READMEFILENAME}::file doesn't exist!"
  echo "This is a requirement in the SDLC: https://wiki.stb.intra/display/DKUF/Phase+2%3A+Design+to+Meet+Security+Requirements"
  exit 1
fi




