ActiveAdmin.register ApiKey do
  permit_params :name, :url, :description, :active

  ####################
  # Filters          #
  ####################
  filter :name_or_description, as: :string, label: "Name or Description"

  ####################
  # Form             #
  ####################
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url, label: "URL"
      f.input :description
      f.input :active
    end
    f.actions
  end
end
