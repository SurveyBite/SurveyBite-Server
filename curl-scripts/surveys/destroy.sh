#!/bin/bash

API="http://localhost:4741"
URL_PATH="/surveys"
TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
ID="62728d3021b83707ca27bfa4"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}"

echo
