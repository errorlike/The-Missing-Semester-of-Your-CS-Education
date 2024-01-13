#!/usr/bin/env bash

n=$((RANDOM % 100))

if [[ n -eq 42 ]]; then
   echo "Something went wrong"
   echo >&2 "The error was using magic numbers"
   exit 1
fi

echo "Everything went according to plan"
