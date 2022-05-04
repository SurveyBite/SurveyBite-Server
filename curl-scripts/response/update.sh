TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
RESPONSE_ID="6272dd876bf1a91f3a2bd2ed"
CONTENT="This ia a new test"
SURVEYID="6272a13174a2fa1337a08e67"
USER_ID="62713ef0647b990ea5965ed7"
 
  curl "http://localhost:4741/responses/${RESPONSE_ID}" \
    --include \
    --request PATCH \
    --header "Authorization: Bearer ${TOKEN}" \
    --header "Content-Type: application/json" \
    --data '{
      "response": {
        "content": "'"${CONTENT}"'",
        "surveyId": "'"${SURVEYID}"'",
        "owner": "'"${USER_ID}"'"
      }
    }'