
  
# TITLE="Amazing Restaurant" CONTENT="5 out of 5 stars" REST_ID="ID_HERE" USER_ID="ID_HERE" sh curl-scripts/questions/create.sh

TITLE="quetion 100 testing"
CONTENT="content 100 testing"
SURVEYID="62702bd15d512f19e3192245"
USER_ID="626ed3fe209b8605af744ee5"

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