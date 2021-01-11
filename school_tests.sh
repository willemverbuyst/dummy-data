#!/bin/bash

# Create a file

touch sb_dummy_school_tests.txt

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
      echo "{
        question1: 1,
        question2: 2,
        question3: 3,
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