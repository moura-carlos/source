ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :username, :email, :password, :password_confirmation # :password_digest
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :username, :email, :password_digest]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :name
    column :username
    column :email
    column :subscription_plan
    column :is_subscription_active
    actions
  end

  form do |f|
    inputs 'Personal Information' do
      input :name
      input :username
      input :email
    end
    # f.inputs          # builds an input field for every attribute
    # f.actions         # adds the 'Submit' and 'Cancel' buttons
    actions
  end
end
