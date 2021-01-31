#!/bin/bash

function createTxtFiles () {
  CURRENT_DATE=$(date +'%m/%d/%Y')
  for i in {1..10}
  do
    for l in {1..20}
    do
      echo "${CURRENT_DATE} | STATUS | This is line ${l} in the file" >> "Dummy_file_${i}.txt"
    done
  done
}

if [[ -d "TXT_FILES" ]]
then
  echo "Folder already exists"
else 
  mkdir DUMMY_TXT_FILES
  cd ./DUMMY_TXT_FILES
  createTxtFiles
fi






