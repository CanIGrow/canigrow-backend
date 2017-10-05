json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.location @user.location
  json.bio @user.bio
  json.token @user.api_token
  json.href user_url(@user)
end
