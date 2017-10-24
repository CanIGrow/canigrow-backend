ActiveAdmin.register Plot do
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


  show do
    attributes_table do
      row :title
      row :user do |plot|
        plot.user.username
      end
      row :plant do |plot|
        plot.plants do |plant|
          plant.scientific_name
        end
      end
      # row :image do |ad|
      #   image_tag ad.image.url
      # end
    end
    active_admin_comments
  end


end
