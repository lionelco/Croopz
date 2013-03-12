class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

    def show
    @occurrences = Occurrence.where("company_id = ?", current_user.company_id)


 @h = LazyHighCharts::HighChart.new('graph', style: '') do |f|
  f.options[:chart][:defaultSeriesType] = "line"
  f.options[:plotOptions] = {areaspline: {pointInterval: 1.day, pointStart: 10.days.ago}}
  f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
  f.xAxis(type: :datetime)
end

        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])

        @h = LazyHighCharts::HighChart.new('graph', style: '') do |f|
          f.options[:chart][:defaultSeriesType] = "line"
          f.options[:plotOptions] = {areaspline: {pointInterval: 1.day, pointStart: 30.days.ago}}
          f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
          f.xAxis(type: :datetime)

        end
    end
 
    def new
      @user = User.new
    end
    
    def index
      @users = User.where("company_id = ?", current_user.company_id).paginate(page: params[:page])
      #@users = User.paginate(page: params[:page])
    end

    def create
      @user = User.new(params[:user])

    if current_user.admin? && current_user.company_id != nil
      @user.company_id = current_user.company_id
      if @user.save
        u_sign_in current_user
        flash[:success] = "A new user has been created!"
        redirect_to @user
      else
        render 'new'
      end      
    else
      if @user.save
        u_sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
    end
    end

    def edit
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end

    def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      u_sign_in @user
        render 'companies/new'
    else
      render 'edit'
    end
  end

    
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
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
