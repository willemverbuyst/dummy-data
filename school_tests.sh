#!/bin/bash

# Create a file
touch sb_dummy_school_tests.txt

shuffle() {
  local i tmp size max rand

  # Get the size of the array
  size=${#array[*]}

  # $RANDOM % (i+1) is biased because of the limited range of $RANDOM
  # Compensate by using a range which is a multiple of the array size.
  max=$(( 32768 / size * size ))

  for ((i=size-1; i>0; i--)); do
    while (( (rand=$RANDOM) >= max )); do :; done
    rand=$(( rand % (i+1) ))
    tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
  done
}

# Create an array with numbers 1 to 5
array=( $(seq 5) )

# Loop over ssubjects (3)
# Loop over students (3)
# Loop 10 times over date, today - 1, 2,... 10
# Generate random scores for answer, 0 or 1
# Write to text-file

for i in {1..3}
do
  for j in {1..3}
  do
    for k in {1..10}
    do
      shuffle
      echo "{
  question1: ${array[0]}, 
  question2: ${array[1]}, 
  question3: ${array[2]}, 
  answer1: $(($RANDOM%2)),
  answer2: $(($RANDOM%2)),
  answer3: $(($RANDOM%2)),
  createdAt: new Date(new Date().setDate(new Date().getDate() - $k)),
  updatedAt: new Date(new Date().setDate(new Date().getDate() - $k)),
  subjectId: $j,
  studentId: $i,
}," >> sb_dummy_school_tests.txt
    done
  done
done

