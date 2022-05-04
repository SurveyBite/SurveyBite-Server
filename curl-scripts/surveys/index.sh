#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="c5ec309970824d9d68b3e856ac01b731"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
