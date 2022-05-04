#!/bin/sh

API="http://localhost:4741"
URL_PATH="/responses"
TOKEN="4c75aac8311907b7a3d8a2b737a7353e"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
