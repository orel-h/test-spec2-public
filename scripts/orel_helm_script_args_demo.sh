#!/bin/bash

#Define the string value
text=$(kubectl get svc --namespace $1 | grep nginx)

# Set space as the delimiter
IFS=' '

#Read the split words into an array based on space delimiter
read -a strarr <<< "$text"

#Count the total words
echo "There are ${#strarr[*]} words in the text."

#Print the nginx URL
output1=${strarr[3]}
echo "service URL"
echo $output1