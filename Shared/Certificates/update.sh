#!/bin/bash 
ls hooks | while read name; do
	hooks/$name
done
