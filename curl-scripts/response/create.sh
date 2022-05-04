TOKEN="5b6d9b3384a533f984d1bfc667a803d7"
CONTENT="tester content"
SURVEYID="62713efd647b990ea5965ed8"
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