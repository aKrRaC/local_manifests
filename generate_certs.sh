#!/bin/bash

# Define the subject for the initial certificates
subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=akhilrac2000@gmail.com'

# Print the subject line
echo "Using Subject Line:"
echo "$subject"

# Prompt the user to verify if the subject line is correct
read -p "Is the subject line correct? (y/n): " confirmation

# Check the user's response
if [[ $confirmation != "y" && $confirmation != "Y" ]]; then
    echo "Exiting without changes."
    exit 1
fi
clear

# Generate certificates
for x in releasekey platform shared media networkstack verity otakey testkey cyngn-priv-app sdk_sandbox bluetooth verifiedboot nfc; do
    ./development/tools/make_key vendor/awaken/signing/keys/$x "$subject"
done

echo "Done! Now build as usual."
echo "Make copies of your vendor/awaken/signing/keys folder as it contains your keys!"
sleep 3