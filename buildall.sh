#!/bin/bash

for i in *
do
	test -d $i || continue
	echo " >>> buind $i"
	./builder.sh $i
done
