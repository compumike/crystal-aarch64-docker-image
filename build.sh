#!/bin/bash

set -e 

. ./config

exec docker build "${build_opts[@]}" -t "${image}" .
