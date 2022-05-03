
  
# TITLE="Amazing Restaurant" CONTENT="5 out of 5 stars" REST_ID="ID_HERE" USER_ID="ID_HERE" sh curl-scripts/question/create.sh

TITLE="Question 2"
CONTENT="What do you want question 2 to be?"
SURVEYID="627082e57af43f0817f64d01"
USER_ID="62708066b52102073a2bd3f9"

  curl 'http://localhost:4741/questions' \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --data '{
      "question": {
        "title": "'"${TITLE}"'",
        "content": "'"${CONTENT}"'",
        "surveyId": "'"${SURVEYID}"'",
        "owner": "'"${USER_ID}"'"
      }
    }'