#!/bin/bash

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="af5f7c5929ddf5985c90ce7415d7b6c9"
TEXT="text test 2"
TITLE="test title 2"


curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "survey": {
      "text": "'"${TEXT}"'",
      "title": "'"${TITLE}"'"
    }
  }'

echo
