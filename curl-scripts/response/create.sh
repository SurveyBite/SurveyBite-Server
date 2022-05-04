TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
CONTENT="tester content"
SURVEYID="6272a13174a2fa1337a08e67"
USER_ID="62713ef0647b990ea5965ed7"
 
  curl 'http://localhost:4741/responses' \
    --include \
    --request POST \
    --header "Authorization: Bearer ${TOKEN}" \
    --header "Content-Type: application/json" \
    --data '{
      "response": {
        "content": "'"${CONTENT}"'",
        "surveyId": "'"${SURVEYID}"'",
        "owner": "'"${USER_ID}"'"
      }
    }'