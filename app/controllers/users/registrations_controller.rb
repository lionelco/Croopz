class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
    if current_user.admin == false
      current_user.admin = true
      current_user.save
    end
  end

end
