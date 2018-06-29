#!/bin/bash
docker run --rm -it -e USER=${GITHUB_USER} -e PASS=${GITHUB_PASS} -e UID=$(id -u) -e GID=$(id -g) -v $(pwd):/doc lemmaa/md2pdf $*

