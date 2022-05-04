 TOKEN="c5ec309970824d9d68b3e856ac01b731"
 RESPONSE_ID="6271d4858a61b22cf8725419"
 SURVEYID="62713efd647b990ea5965ed8"

 curl "http://localhost:4741/responses/${RESPONSE_ID}" \
    --include \
    --request DELETE \
    --header "Authorization: Bearer ${TOKEN}" \
    --header "Content-Type: application/json" \
    --data '{
      "response": {
        "surveyId": "'"${SURVEYID}"'"
      }
    }'