TOKEN="c5ec309970824d9d68b3e856ac01b731"
RESPONSE_ID="6271d4858a61b22cf8725419"
CONTENT="updating content"
SURVEYID="62713efd647b990ea5965ed8"
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