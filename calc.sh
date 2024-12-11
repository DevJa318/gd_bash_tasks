#!/bin/bash
# - Write bash script accepting operation parameter (“-”, “+”, “*”, “%”), sequence of numbers and debug flag. For example:
#  ./your_script.sh -o % -n 5 3 -d > Result: 2
# ./your_script.sh -o + -n 3 5 7 -d > Result: 15
# If -d flag is passed, script must print additional information:
# User: <username of the user running the script>
# Script: <script name>        
# Operation: <operation>
# Numbers: <all space-separated numbers>

while [[ $# -gt 0 ]]; do
 case "$1" in
  -o) operator="$2"; shift 2 ;;
  -n) shift; numbers=(); while [[ $1 && $1 != -* ]]; do numbers+=("$1"); shift; done ;;
  -d) debug=true; shift ;;
 esac
done

case $operator in
    "-")
     result=${numbers[0]}
     for ((i=1; i<${#numbers[@]}; i++));
     do ((result -= numbers[i])); 
     done
    ;;
    "+")
    for num in "${numbers[@]}";
      do ((result += num));
    done
    ;;
    "*")
    result=1; 
    for num in "${numbers[@]}"; 
    do ((result *= num)); 
    done
    ;;
    "%")
    result=${numbers[0]}; 
    for ((i=1; i<${#numbers[@]}; i++)); 
    do ((result %= numbers[i]));
    done
    ;;
esac

echo "Result: $result"

if [ "$debug" = true ]; then
   echo "User: $(whoami)"
   echo "Script: $0"
   echo "Operation: $operator"
   echo "Numbers: ${numbers[*]}"
fi