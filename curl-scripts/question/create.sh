
  
# TITLE="Amazing Restaurant" CONTENT="5 out of 5 stars" REST_ID="ID_HERE" USER_ID="ID_HERE" sh curl-scripts/question/create.sh

TITLE="Question 2"
CONTENT="What do you want question 2 to be?"
SURVEYID="62716892d7498117ac92afb8"
USER_ID="62713ef0647b990ea5965ed7"

  curl 'http://localhost:4741/questions' \
    --include \
    --request POST \
    --header "Authorization: Bearer ${TOKEN}" \
    --header "Content-Type: application/json" \
    --data '{
      "question": {
        "title": "'"${TITLE}"'",
        "content": "'"${CONTENT}"'",
        "surveyId": "'"${SURVEYID}"'",
        "owner": "'"${USER_ID}"'"
      }
    }'