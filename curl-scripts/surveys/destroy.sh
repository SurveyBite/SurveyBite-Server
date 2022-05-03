#!/bin/bash

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="af282484591cd9d7f3ce1ec08f996421"
ID="627080bab52102073a2bd3fa"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
