json.users @users do |user|
  json.user_id user.id
  json.username user.username
  json.bio user.bio
  json.token user.api_token
  json.href user_url(user)
  json.plots user.plots do |plot|
    json.plot plot.name
    json.plot_id plot.id
      json.plants plot.plants do |plant|
        json.plant_id plant.id
        json.plant plant.common_name
      end
  end
end
