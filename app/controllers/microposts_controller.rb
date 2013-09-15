class MicropostsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
    
    def create
        @micropost = current_user.microposts.build(params[:micropost])
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
            else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    def destroy
    end
end