#!/bin/bash

cd `dirname "$0"`/../../../Android/
./generate.sh base
./make.sh
rm flashable.zip
