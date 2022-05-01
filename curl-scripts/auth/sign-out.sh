#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"
TOKEN="f2367e92852d54e050405b1feb4b0440"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
