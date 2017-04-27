ActiveAdmin.register User do
  actions :all, :except => [:new]
  permit_params :email, :role
  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :role
    end
    f.actions
  end
end
