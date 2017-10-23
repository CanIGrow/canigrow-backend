ActiveAdmin.register Plant do
  permit_params :umn_plantID, :common_name, :scientific_name, :height, :spread, :form, :seasonal_interest, :seasonal_interest_specific, :flower_color, :landscape_use, :light, :zone, :soil, :notes, :cultivar_group, :vitamins, :maturity, :spring_start_relative_last_frost, :transplant_spring_start_relative_last_frost, :fall_start_relative_first_frost, :transplant_fall_relative_first_frost
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  id_column
  column :common_name
  column :scientific_name
  # column :height
  # column :spread
  # column :form
  # column :seasonal_interest
  # column :seasonal_interest_specific
  # column :flower_color
  # column :landscape_use
  # column :light
  # column :zone
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

end
