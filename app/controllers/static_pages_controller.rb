class StaticPagesController < ApplicationController
    
  def home
    if user_signed_in?
        #@micropost  = current_user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page])
        @targets = Target.where("company_id = ?", current_user.company_id)
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
