#!/bin/bash
#
# Author: @ntkme
#

pushd "$(dirname "$0")" >/dev/null

test/test-url-list.sh test/test-url-list.txt

popd >/dev/null
