API="http://localhost:4741"
URL_PATH="/responses"
TOKEN="4c75aac8311907b7a3d8a2b737a7353e"
REESPONSEID="6272d4fa7d1d01152f32198a"


curl "${API}${URL_PATH}/${RESPONSEID}" \
  --include \
  --request GET \
  --header "Authorization: Bearer ${TOKEN}" \
  --header "Content-Type: application/json" \

echo