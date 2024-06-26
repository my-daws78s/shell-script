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

#This way calling script variable values will not change after calling other script
#PIDs of 2 scripts are different


echo "Testing source way of calling shell script ......."

source ./16-other-script.sh
echo "$COURSE"
echo "PID of current script is: $$"

# Output for above is as follows:

# Testing source way of calling shell script .......
# I am in the other script now.
# 1669 is the PID of other script.
# I am in the other script now.
# PID of current script is: 1669

#variable value changes after calling other script
#PID of 2 scripts will not change.
