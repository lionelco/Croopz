ActiveAdmin.register User do

  form do |f|                         
    f.inputs "Admin Details" do  
      f.input :name  
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :admin
    end                               
    f.actions                         
  end      

end
