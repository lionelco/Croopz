class Users::InvitationsController < Devise::InvitationsController

  def update
      super
      self.resource = resource_class.to_adapter.get!(current_user.to_key)  
      resource.admin = false 
      resource.company_id = User.find_by_id(params[resource_name][:invited_by_id]).company_id
      resource.save
  end

end