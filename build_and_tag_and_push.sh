#!/bin/bash

set -e

. ./config

# Build and tag as :latest
./build.sh

# Extract version tags 
echo
echo "Querying ${image}:latest for Crystal version..."
version_tags_script="parts=Crystal::VERSION.split(\".\")
puts parts.size \
  .times \
  .map { |i| \
    parts[0..i].join(\".\")
  }.join(\" \")"
read -r -a version_tags < <(docker run --rm "${image}:latest" crystal eval "${version_tags_script}")
echo "${#version_tags[@]} version tags: ${version_tags[*]}"

# Confirmation
read -p "Tag and push? (y/n) " -n 1 -r
echo
if [ "$REPLY" != "y" ]
then
  exit 1
fi

# Push tags
echo
echo "Pushing ${image}:latest ..."
docker push "${image}:latest"
for tag in "${version_tags[@]}"; do
  echo "Tagging ${image}:${tag} ..."
  docker tag "${image}:latest" "${image}:${tag}"
  echo "Pushing ${image}:${tag} ..."
  docker push "${image}:${tag}"
done
