ActiveAdmin.register Note do
  permit_params :title, :content, :user

  index do
    id_column
    column :title
    column :content
    column :user do |item|
      if item.user.present?
        link_to item.user, admin_user_path(item.user)
      end
    end
    column :created_at
    column :updated_at
    actions
  end
end
