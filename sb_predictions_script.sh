#!/bin/bash

# Create a file

touch sb_dummy_predictions.txt

# Log a prediction

for i in {573164..573469}
do
  for u in {1..4}
  do
    echo "{
  pGoalsHomeTeam: $(( ( RANDOM % 5 )  + 0 )),
  pGoalsAwayTeam: $(( ( RANDOM % 5 )  + 0 )),
  userId: $u,
  fixtureId: $i,
  createdAt: new Date(),
  updatedAt: new Date(),
}," >> sb_dummy_predictions.txt
  done
done

