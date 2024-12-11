#!/bin/bash
# - You need to write a script that prints the numbers from 1 to 100 such that:
# If the number is a multiple of 3, you need to print "Fizz" instead of that number.
# If the number is a multiple of 5, you need to print "Buzz" instead of that number.
# If the number is a multiple of both 3 and 5, you need to print "FizzBuzz" instead of that number.

# Shellcheck podkreśla mi $i%3 i $i%5, czy powinnam to jakoś zmienić?
# -eq treats this as an arithmetic expression. Use = to compare as string (or expand explicitly with $((expr)))

for i in {1..100}
do
if [[ $((i%3)) -eq 0 ]] && [[ $((i%5)) -eq 0 ]]; then
echo "FizzBuzz"
elif [[ $((i%3)) -eq 0 ]]; then
echo "Fizz"
elif [[ $((i%5)) -eq 0 ]]; then
echo "Buzz"
else
echo "$i"
fi
done