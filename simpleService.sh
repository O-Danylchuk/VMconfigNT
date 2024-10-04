#!/bin/bash

time=$(date + "%d %b %y %H:%M")
echo $time

top -b -o %MEM | head -n 17 | tail -n 11 | awk '{print $12, $10}' | column -t	
