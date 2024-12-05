#!/bin/bash
# - Write bash script accepting operation parameter (“-”, “+”, “*”, “%”), sequence of numbers and debug flag. For example:
#  ./your_script.sh -o % -n 5 3 -d > Result: 2
# ./your_script.sh -o + -n 3 5 7 -d > Result: 15
# If -d flag is passed, script must print additional information:
# User: <username of the user running the script>
# Script: <script name>        
# Operation: <operation>
# Numbers: <all space-separated numbers>


while getopts "hdo:" flag; do
 case $flag in
   h) # Handle the -h flag
   echo "Display script help information"
   ;;
   d) # Handle the -d flag
   echo "User: $(whoami)"
   echo "Script: $0"
   echo "Operation: $operator"
   echo "Numbers: $@"
   ;;
   o) # Handle the -f flag with an argument
   operator=$OPTARG
   # Process the specified file
   ;;
   \?)
   # Handle invalid options
   ;;
 esac
done

case $operator in
    "-")
    
    ;;
    "+")

    ;;
    "*")

    ;;
    "%")
    
    ;;
esac

