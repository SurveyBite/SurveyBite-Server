 TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
 RESPONSE_ID="6272d4fa7d1d01152f32198a"
 SURVEYID="6272a13174a2fa1337a08e67"

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