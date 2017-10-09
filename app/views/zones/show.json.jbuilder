json.zone do
  json.zone_id @zone.id
  json.zip @zone.zip
  json.zone @zone.zone
  json.temp_range @zone.temp_range
  json.concat @zone.concat
  json.href zone_url(@zone)
end
