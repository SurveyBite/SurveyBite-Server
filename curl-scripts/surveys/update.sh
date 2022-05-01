#!/bin/bash

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="af5f7c5929ddf5985c90ce7415d7b6c9"
ID="626ee45a595dd20a74c9ef15"
TEXT="test 23"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "survey": {
      "text": "'"${TEXT}"'"
    }
  }'

echo
