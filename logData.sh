#!/bin/bash

# Create a file
touch logData.txt

# Delete previous data
> logData.txt

#! /bin/bash 
arr_csv=() 
while IFS= read -r line 
do
  arr_csv+=("$line")
done < TEST_csvLog.txt

# echo "Displaying the contents of array mapped from csv file:"
index=0
for record in "${arr_csv[@]}"
do
    echo "Record at index ${index}: $record"
	((index++))
done