json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.location @user.location
  json.bio @user.bio
  json.token @user.api_token
  json.plots @user.plots
  json.href user_url(@user)
end
