#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="5b6d9b3384a533f984d1bfc667a803d7"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
