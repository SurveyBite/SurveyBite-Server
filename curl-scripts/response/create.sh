CONTENT="tester"
SURVEYID="62716892d7498117ac92afb8"
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