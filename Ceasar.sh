#!/bin/bash
# - Write caesar cipher script accepting three parameters -s <shift> -i <input file> -o <output file>
# If -v tag is passed, replaces lowercase characters with uppercase and vise versa
# If -s is passed, script substitutes <A_WORD> with <B_WORD> in text (case sensitive)
# If -r is passed, script reverses text lines
# If -l is passed, script converts all the text to lower case
# If -u is passed, script converts all the text to upper case
# Script should work with -i <input file> -o <output file> tags


while getopts "