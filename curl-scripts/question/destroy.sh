
QUESTION_ID="626ff8ae721aac10abec9a1a"
SURVEY_ID="626ff0c026fbf10a28394020"


curl "http://localhost:4741/questions/${QUESTION_ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --data '{
    "question": {
      "surveyId": "'"${SURVEY_ID}"'"
    }
  }'