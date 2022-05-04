API="http://localhost:4741"
URL_PATH="/responses"
TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
RESPONSE_ID="6272dd876bf1a91f3a2bd2ed"
SURVEYID="6272a13174a2fa1337a08e67"

curl "${API}${URL_PATH}/${RESPONSE_ID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
      "response": {
        "surveyId": "'"${SURVEYID}"'"
      }
    }'
echo