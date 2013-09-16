class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user

    def index
        @users = User.where("company_id = ?", current_user.company_id).paginate(page: params[:page])
    end

    def new
        @user = User.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @target }
      end
    end

    def show
    @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end

    #def create
    #  User.create!({:email => params[:email], :admin => [false], :company_id => [current_user.company_id], :password => params[:password], :password_confirmation => params[:password_confirmation] })
    #end

    def edit
      @user = User.find(params[:id])
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end

    def update
    if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        render 'companies/new'
      else
        render 'edit'
      end
    end
    
  private

    def signed_in_user
      unless user_signed_in?
        store_location
        redirect_to new_user_session_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
end
