#!/bin/bash

DIR=`dirname "$0"`
ls "$DIR/hooks" | while read name; do
	"$DIR/hooks/$name"
	echo "$DIR/hooks/$name" executed!
done
