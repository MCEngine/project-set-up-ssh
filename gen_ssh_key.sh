#!/bin/bash

# Ensure email is provided
if [ -z "$ssh_email" ]; then
    echo "Error: Environment variable 'ssh_email' is not set."
    exit 1
fi

# Define the output file
OUTPUT_FILE="../data/ssh/ssh.txt"
KEY_FILE="id_rsa"

# Create the SSH key
ssh-keygen -t rsa -b 4096 -C "$ssh_email" -f "$KEY_FILE" -N ""

# Ensure the data directory exists
mkdir -p data

# Write the keys to the file
echo "Public Key:" > "$OUTPUT_FILE"
cat "${KEY_FILE}.pub" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Private Key:" >> "$OUTPUT_FILE"
cat "$KEY_FILE" >> "$OUTPUT_FILE"

# Secure the private key
chmod 600 "$KEY_FILE"

echo "SSH key pair generated successfully."
echo "Keys saved in $OUTPUT_FILE"
