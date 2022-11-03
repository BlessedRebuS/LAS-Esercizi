#!/bin/bash

sleep 10 &
A=$!
sleep 20 &
B=$!

while true
do
	sleep 5
	echo "Primo processo ->" ps $A
	echo "Secondo processo ->" ps $B
	jobs
done

