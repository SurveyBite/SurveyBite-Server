#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="24791d81f1c4b9049b1705bf2d637dc4"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
