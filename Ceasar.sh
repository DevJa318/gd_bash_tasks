#!/bin/bash

caesar_cipher() {
    local text="$1"
    local shift="$2"
    local result=""
    
    for ((i=0; i<${#text}; i++)); do
        char="${text:i:1}"
        if [[ "$char" =~ [a-z] ]]; then
            ascii=$(printf "%d" "'$char")
            new_char=$(printf "\\$(printf '%03o' $(( (ascii - 97 + shift) % 26 + 97 )) )")
            result+="$new_char"
        elif [[ "$char" =~ [A-Z] ]]; then
            ascii=$(printf "%d" "'$char")
            new_char=$(printf "\\$(printf '%03o' $(( (ascii - 65 + shift) % 26 + 65 )) )")
            result+="$new_char"
        else
            result+="$char"
        fi
    done
    
    echo "$result"
}

while getopts "s:i:o:" opt; do
  case $opt in
    s) shift_value=$OPTARG ;;
    i) input_file=$OPTARG ;;
    o) output_file=$OPTARG ;;
    *) echo "Usage: $0 -s <shift> -i <input_file> -o <output_file>"; exit 1 ;;
  esac
done

if [[ -z "$shift_value" || -z "$input_file" || -z "$output_file" ]]; then
    echo "Error: Missing required arguments. Usage: $0 -s <shift> -i <input_file> -o <output_file>"
    exit 1
fi

if [[ ! -f "$input_file" ]]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
fi

input_text=$(cat "$input_file")

encrypted_text=$(caesar_cipher "$input_text" "$shift_value")

echo "$encrypted_text" > "$output_file"

echo "Encryption complete. The encrypted text has been saved to $output_file."
