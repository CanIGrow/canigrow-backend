ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Plants" do
          ul do
            Plant.last(15).map do |plant|
              li link_to(plant.common_name, admin_plant_path(plant))
            end
          end
        end
      end

      index :id => 'master_files' do
      selectable_column
      column :id
      column :filename
      column :title do |mf|
         truncate_words(mf.title)
      end
      column :description do |mf|
         truncate_words(mf.description)
      end
      column :date_archived do |mf|
         format_date(mf.date_archived)
      end
      column :date_dl_ingest do |mf|
         format_date(mf.date_dl_ingest)
      end
      column :pid
      column ("Metadata Record") do |mf|
         if !mf.metadata.nil?
            div do
               link_to "#{mf.metadata_title}", "/admin/#{mf.metadata.url_fragment}/#{mf.metadata.id}"
            end
         end
      end
      column :unit
      column("Thumbnail") do |mf|
         if mf.deaccessioned?
            span class: "deaccessioned" do "Deaccessioned" end
         else
            link_to image_tag(mf.link_to_image(:small)),
               "#{mf.link_to_image(:large)}", :rel => 'colorbox', :title => "#{mf.filename} (#{mf.title} #{mf.description})"
         end
      end
      column("") do |mf|
         div do
            link_to "Details", resource_path(mf), :class => "member_link view_link"
         end
         if !mf.metadata.nil? && !mf.unit.date_archived.blank? && !mf.deaccessioned?
            div do
               link_to "PDF", "#{Settings.pdf_url}/#{mf.pid}", target: "_blank"
            end
         end
         if !current_user.viewer? && !current_user.student? && !mf.deaccessioned?
            div do
               link_to I18n.t('active_admin.edit'), edit_resource_path(mf), :class => "member_link edit_link"
            end
            div do
               link_to "OCR", "/admin/ocr?mf=#{mf.id}"
            end
         end
         if mf.date_archived && !mf.deaccessioned?
            div do
               link_to "Download", download_from_archive_admin_master_file_path(mf.id), :method => :get
            end
         end
      end
   end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end # content
end
