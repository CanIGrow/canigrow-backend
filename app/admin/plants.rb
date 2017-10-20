ActiveAdmin.register Plant do
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
  column :height
  column :spread
  column :form
  column :seasonal_interest
  column :seasonal_interest_specific
  column :flower_color
  column :landscape_use
  column :light
  column :zone
  column :soil
  column :notes
  column :created_at
  column :updated_at
  column :cultivar_group
  column :vitamins
  column :maturity
  column :spring_start_relative_last_frost
  column :transplant_spring_start_relative_last_frost
  column :fall_start_relative_first_frost
  column :transplant_fall_relative_first_frost
  actions
end

end
