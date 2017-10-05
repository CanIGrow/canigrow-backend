json.users @users do |user|
  json.user_id user.id
  json.username user.username
  json.bio user.bio
  json.token user.api_token
  json.href user_url(user)
end
