json.user do
  json.id @user.id
  json.username @user.username
  json.plots @user.plots do |plot|
    json.plot_id plot.id
    json.name plot.name
      json.plants plot.plants do |plant|
        json.plant plant.common_name
      end
  end
end
