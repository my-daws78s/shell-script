#!/bin/bash

COURSE="I am in the current script"
echo "$COURSE"
echo "PID of current script is: $$"

./16-other-script.sh

echo "$COURSE"
echo "PID of current script is: $$"

