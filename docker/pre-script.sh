#!/bin/bash

HAS_FMU_NET=$(docker network ls | grep cms-network)

if [[ -z "$HAS_FMU_NET" ]]; then
  docker network create cms-network
fi
