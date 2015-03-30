#!/bin/bash

SOURCE_DIR=$(dirname "$0")

cat "$SOURCE_DIR/test/test-url-list.txt" | xargs "$SOURCE_DIR/test/test-url.sh"

