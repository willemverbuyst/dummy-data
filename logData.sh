#!/bin/bash

# Create a file
touch logData.js

# Delete previous data
> logData.js

# arr_csv=() 
while IFS="|" read -r rec_column1 rec_column2 rec_column3 rec_column4 rec_column5 rec_column6
do
  if [[ $rec_column3 == "home" ]]
  then
    arr_csv+=("{
                date: '$rec_column2', 
                statusOfDay: '$rec_column3',
                weekNumber: $rec_column1
              }")
  else 
    arr_csv+=("{
                date: '$rec_column2', 
                durationTrip: '$rec_column6', 
                meansOfTransport: '$rec_column3', 
                routeTripFrom: '$rec_column4',
                routeTripTo: '$rec_column4',
                statusOfDay: '$rec_column3',
                weekNumber: $rec_column1
              }")
  fi
done < TEST_csvLog.txt

echo "const logData = [" >> logData.js

# echo "Displaying the contents of array mapped from csv file:"
index=0
for record in "${arr_csv[@]}"
do
    echo "$record", >> logData.js
	((index++))
done

echo "]" >> logData.js