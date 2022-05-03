#!/bin/sh

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="483938bdfc2252db6c49818ba8bfb905"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}"

echo
