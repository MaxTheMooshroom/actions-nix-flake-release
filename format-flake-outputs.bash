#!/usr/bin/env bash

function main {
  IFS=',' read -ra FLAKE_OUTPUTS <<< "$1"
  printf ".#%s " "${FLAKE_OUTPUTS[@]}"
}

main "$@"

