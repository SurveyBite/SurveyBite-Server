TITLE="This place not so great"
CONTENT="I'm not to sure why"
SURVEYID="626ff0c026fbf10a28394020"
QUESTION_ID="626ff8ae721aac10abec9a1a"
USER_ID="626ed3fe209b8605af744ee5"

curl "http://localhost:4741/questions/${QUESTION_ID}" \
  --include \
  --request PATCH \
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