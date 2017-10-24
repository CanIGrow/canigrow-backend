ActiveAdmin.register Plant do
  permit_params :umn_plantID, :common_name, :scientific_name, :height, :spread, :form, :seasonal_interest, :seasonal_interest_specific, :flower_color, :landscape_use, :light, :zone, :soil, :notes, :cultivar_group, :vitamins, :maturity, :spring_start_relative_last_frost, :transplant_spring_start_relative_last_frost, :fall_start_relative_first_frost, :transplant_fall_relative_first_frost

  config.batch_actions = false

index do
  # selectable_column
  id_column
  column :common_name
  column :scientific_name
  column :height
  # column :spread
  # column :form
  # column :seasonal_interest
  # column :seasonal_interest_specific
  # column :flower_color
  # column :landscape_use
  column :light
  column :zone, sortable: false do |plant|
    plant.zone.strip!
    if plant.zone == "Annual"
      plant.zone
    else
      zone_low = plant.zone.split(',')[0].to_s
      if plant.zone.chars.count > 1
        zone_high = plant.zone.split(',')[-1].to_s
        zone_low + ' -' + zone_high
      else
        zone_low
      end
    end

  end
  # column :soil
  # column :notes
  # column :created_at
  # column :updated_at
  # column :cultivar_group
  # column :vitamins
  # column :maturity
  # column :spring_start_relative_last_frost
  # column :transplant_spring_start_relative_last_frost
  # column :fall_start_relative_first_frost
  # column :transplant_fall_relative_first_frost
  actions
end

form title: 'New Plant' do |f|
    inputs 'Details' do
      input :common_name
      input :scientific_name
      input :height
      input :spread
      input :form
      input :seasonal_interest
      input :seasonal_interest_specific
      input :flower_color, as: :string
      input :landscape_use
      input :light
      input :zone
      input :soil
      input :notes
      # input :created_at
      # input :updated_at
      input :cultivar_group
      input :vitamins
      input :maturity
      input :spring_start_relative_last_frost
      input :transplant_spring_start_relative_last_frost
      input :fall_start_relative_first_frost
      input :transplant_fall_relative_first_frost
    end
    actions
  end

  filter :common_name
  filter :scientific_name
  filter :zone
  filter :light
  filter :soil
  filter :height
  filter :spread
  filter :form
  filter :seasonal_interest
  filter :seasonal_interest_specific
  filter :flower_color, as: :string
  filter :landscape_use



  filter :notes
  # filter :created_at
  # filter :updated_at
  filter :cultivar_group
  filter :vitamins
  filter :maturity
  filter :spring_start_relative_last_frost
  filter :transplant_spring_start_relative_last_frost
  filter :fall_start_relative_first_frost
  filter :transplant_fall_relative_first_frost

end
