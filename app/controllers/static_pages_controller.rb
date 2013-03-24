class StaticPagesController < ApplicationController
    
  def home
    if signed_in?
        @micropost  = current_user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page])

        @targets = Target.where("company_id = ?", current_user.company_id)

        #@company = Company.find_by_id(current_user.company_id)
        #@targets = @company.targets.all
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
