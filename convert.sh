#!/bin/bash

#
# GITHUB_USER= \
# GITHUB_PASS= \
# docker run --rm -it -v $(pwd):/doc lemmaa/md2pdf <markdown file>
#

Xvfb :99 &
export DISPLAY=:99

BASE_PATH=$(dirname $1)
FILENAME=$(basename $1)
shift
OPTIONS="$*"

pushd ${BASE_PATH}
grip --user ${USER} --pass ${PASS} ${FILENAME} --export ${FILENAME%.md}.html
wkhtmltopdf ${OPTIONS} ${FILENAME%.md}.html ${FILENAME%.md}.pdf
chown ${UID}.${GID} ${FILENAME%.md}.pdf
rm -f ${FILENAME%.md}.html
popd
