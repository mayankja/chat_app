ActiveAdmin.register Message do
  form do |f|
    f.inputs "Message" do
      f.input :body
    end
    f.actions
  end
end
