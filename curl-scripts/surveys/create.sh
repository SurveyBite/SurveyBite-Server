#!/bin/bash
# sh curl-scripts/surveys/create.sh 

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="24791d81f1c4b9049b1705bf2d637dc4"
TEXT="Hiep 1"
TITLE="hieppie"


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
