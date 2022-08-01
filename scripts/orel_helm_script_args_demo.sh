#!/bin/bash

#Define the string value
text=$(kubectl get svc --namespace $1 | grep nginx)

# Set space as the delimiter
IFS=' '

#Read the split words into an array based on space delimiter
read -a strarr <<< "$text"

url=${strarr[3]}

while [[ $url == "<pending>" ]]; do
    text=$(kubectl get svc --namespace $1 | grep nginx)
    read -a strarr <<< "$text"  
    url=${strarr[3]}
done

#Print the nginx URL
nginx_url=${strarr[3]}
echo "service URL"
echo $nginx_url