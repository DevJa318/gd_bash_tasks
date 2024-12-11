#!/bin/bash

# Write scriptwith following functionality:
# If -v tag is passed, replaces lowercase characters with uppercase and vise versa
# If -s is passed, script substitutes <A_WORD> with <B_WORD> in text (case sensitive)
# If -r is passed, script reverses text lines
# If -l is passed, script converts all the text to lower case
# If -u is passed, script converts all the text to upper case
# Script should work with -i <input file> -o <output file> tags

invert_case() {
    echo "$1" | tr 'a-zA-Z' 'A-Za-z'
}

substitute_words() {
    local input="$1"
    local word_a="$2"
    local word_b="$3"
    echo "$input" | sed "s/$word_a/$word_b/g"
}

while getopts "vs:rli:o:u:" opt; do
    case $opt in
        v) invert=true ;;               # Invert case
        s) substitute=true; word_a=$OPTARG; read -p "Enter B_WORD: " word_b ;;  # Substitute words
        r) reverse=true ;;              # Reverse lines
        l) to_lower=true ;;             # Convert text to lowercase
        u) to_upper=true ;;             # Convert text to uppercase
        i) input_file=$OPTARG ;;        # Input file
        o) output_file=$OPTARG ;;      # Output file
        *) echo "Usage: $0 [-v] [-s <A_WORD> <B_WORD>] [-r] [-l] [-u] -i <input_file> -o <output_file>"; exit 1 ;;
    esac
done

if [[ -z "$input_file" || -z "$output_file" ]]; then
    echo "Error: You must provide both input (-i) and output (-o) files."
    exit 1
fi

if [[ ! -f "$input_file" ]]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
fi

input_text=$(cat "$input_file")

if [[ "$invert" == true ]]; then
    input_text=$(invert_case "$input_text")
fi

# Substitute words
if [[ "$substitute" == true ]]; then
    input_text=$(substitute_words "$input_text" "$word_a" "$word_b")
fi

if [[ "$reverse" == true ]]; then
    input_text=$(echo "$input_text" | tac)
fi

if [[ "$to_lower" == true ]]; then
    input_text=$(echo "$input_text" | tr 'A-Z' 'a-z')
fi

if [[ "$to_upper" == true ]]; then
    input_text=$(echo "$input_text" | tr 'a-z' 'A-Z')
fi

echo "$input_text" > "$output_file"

