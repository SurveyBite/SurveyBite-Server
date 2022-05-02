#!/bin/bash
# sh curl-scripts/surveys/create.sh 

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="4dcac617d3c6126bdb511c66388bae3b"
TEXT="text test 1"
TITLE="test title 1"


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
