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
  json.cultivar_group @plant.cultivar_group
  json.vitamins @plant.vitamins
  json.maturity @plant.maturity
  json.spring_start_relative_last_frost @plant.spring_start_relative_last_frost
  json.transplant_spring_start_relative_last_frost @plant.transplant_spring_start_relative_last_frost
  json.fall_start_relative_first_frost @plant.fall_start_relative_first_frost
  json.transplant_fall_relative_first_frost @plant.transplant_fall_relative_first_frost
  json.comments @plant.comments do |comment|
  json.user comment.user.username
  json.user_href user_url(comment.user)
  json.comment_id comment.id
  json.user_id comment.user_id
  json.body comment.body
  json.datetime comment.datetime
  end
  json.href plant_url(@plant)
end
