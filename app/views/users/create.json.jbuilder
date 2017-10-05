json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.location @user.location
  json.bio @user.bio
end
