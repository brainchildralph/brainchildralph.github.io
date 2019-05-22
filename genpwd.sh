#!/bin/bash
str=Passw0rd!
echo "Please enter your password to encrypt string '$str'..."
read -s pwd
printf "%-20s: %s\n" "Password" $pwd
encData=$(echo -ne "Passw0rd!" | openssl enc -aes-256-cbc -a  -pass pass:${pwd:-ooxx})
printf "%-20s: %s\n" "Encrypted Data" $encData
echo "Test decrypt, please re-enter your password..."
read -s pwd
decData=$(echo "$encData" | openssl enc -aes-256-cbc -a -d -pass pass:$pwd 2>/dev/null)
if [ "$str" == "$decData" ] ; then
  printf "%-20s: %s (Success!!)\n" "Decrypted Data" $decData
else
  printf "%-20s: %s\n" "Decrypted Data" "error!!"
fi
