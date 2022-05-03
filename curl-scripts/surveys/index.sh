#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="af282484591cd9d7f3ce1ec08f996421"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
