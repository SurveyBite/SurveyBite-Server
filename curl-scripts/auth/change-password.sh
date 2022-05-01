#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"
TOKEN="f2367e92852d54e050405b1feb4b0440"
OLDPW="hello"
NEWPW="hello"

curl "${API}${URL_PATH}/" \
  --include \
  --request PATCH \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
