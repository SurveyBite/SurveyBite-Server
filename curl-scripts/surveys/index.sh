#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="af5f7c5929ddf5985c90ce7415d7b6c9"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
