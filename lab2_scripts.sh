#!/bin/bash
# Author : Daniel R. Koris
# Date   : 1/31/2019

#Problem 1 Code: Number of Phone Numbers
number_of_phone_numbers=$(grep -cE '^[0-9]{3}-[0-9]{3}-[0-9]{4}$' regex_practice.txt)
echo "Number of Phone Numbers in regex_practice: $number_of_phone_numbers"

#Problem 2 Code: Number of Emails
number_of_emails=$(grep -cE "^.*@.*\.[a-zA-Z]{2,3}$" regex_practice.txt)
echo "Number of Emails in the regex_practice   : $number_of_emails"

#Remove files if they exist
if [[ -e "phone_results.txt" ]]; then
  rm phone_results.txt
fi

if [[ -e "email_results.txt" ]]; then
  rm email_results.txt
fi

if [[ -e "command_results.txt" ]]; then
  rm command_results.txt
fi

#Problem 3 Code: Output 303 Area Code Phone Numbers into Phone Results
grep -E "303-[0-9]{3}-[0-9]{4}$" regex_practice.txt > phone_results.txt

#Problem 4 Code: Output All @geocities.com emails to email results
grep -E ".*@geocities.com" regex_practice.txt > email_results.txt

#Problem 5 Code: Output command line arguments, if given, and output them to command results
if [[ ! -z $1 ]] && [[ ! -z $2 ]]; then
  grep -E $1 $2 > command_results.txt
else
  echo "Error: Not enough command lines arguments passed for grep"
  echo " - Valid Input: ./lab2_scripts <pattern> <file>"
fi

