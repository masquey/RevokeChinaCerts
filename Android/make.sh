#!/bin/bash
# This script is used to generate configurations by the author.
# The generated content is already included in the repo and you should
# not need to manually run this one.

# remove files
echo "Purging old files..."
rm -rf prebuilt
mkdir prebuilt

echo "Building new configurations"
for type in `echo all restore extended base`;do
    mkdir prebuilt/$type
    bash generate.sh $type
    cp *_blacklist.txt prebuilt/$type/
    cp flashable.zip prebuilt/$type/
    cp rooted.sh prebuilt/$type
done
