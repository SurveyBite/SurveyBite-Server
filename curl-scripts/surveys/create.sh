#!/bin/bash
# sh curl-scripts/surveys/create.sh 

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="e01e49255f14671336b1089f082862c7"
TITLE="Survey 1"
TEXT="text 1"



curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "survey": {
      "title": "'"${TITLE}"'",
      "text": "'"${TEXT}"'"
    }
  }'

echo
