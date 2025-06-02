#!/bin/bash

set -e 

. ./config

docker pull alpine:latest

exec docker build "${build_opts[@]}" -t "${image}" .
