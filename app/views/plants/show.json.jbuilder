json.plant do
  json.plant_id @plant.id
  json.umn_plantID @plant.umn_plantID
  json.common_name @plant.common_name
  json.scientific_name @plant.scientific_name
  json.height @plant.height
  json.spread @plant.spread
  json.form @plant.form
  json.seasonal_interest @plant.seasonal_interest
  json.seasonal_interest_specific @plant.seasonal_interest_specific
  json.flower_color @plant.flower_color
  json.landscape_use @plant.landscape_use
  json.light @plant.light
  json.zone @plant.zone
  json.soil @plant.soil
  json.notes @plant.notes
  json.comments @plant.comments do |comment|
  json.user comment.user.username

  json.comment_id comment.id
  json.user_id comment.user_id
  json.body comment.body
  json.datetime comment.datetime
  end
  json.href plant_url(@plant)
end
