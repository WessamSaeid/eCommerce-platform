ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :name, :avatar, :role, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :avatar, :role, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role

    actions
  end

  form do |f|
      f.semantic_errors 
      f.inputs do
        f.input :email
        f.input :password
        f.input :name
        f.input :role, :as => :select, :collection => ['admin', 'seller']
      end
      f.actions         
  end

  filter :email
  
end
