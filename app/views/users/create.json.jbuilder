json.user do
  json.id @user.id
  json.username @user.username
  json.email @user.email
  json.location @user.location
  json.bio @user.bio
  json.token @user.api_token
  json.plots @user.plots do |plot|
    json.plot_name plot.name
    json.plants plot.plants do |plant|
      json.plant plant.common_name
    end
  end
  json.href user_url(@user)
end
