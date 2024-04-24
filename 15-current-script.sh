#!/bin/bash

COURSE="I am in the current script"
echo "$COURSE"
echo "PID of current script is: $$"

./16-other-script.sh

echo "$COURSE"
echo "PID of current script is: $$"

# Output for above is as follows:

# I am in the current script
# PID of current script is: 1653
# I am in the other script now.
# 1654 is the PID of other script.
# I am in the current script
# PID of current script is: 1653

echo "Testing source way of calling shell script ......."
source ./16-other-script.sh
echo "$COURSE"
echo "PID of current script is: $$"
