class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user

  def index
    if current_user.company_id != nil
      @companies = Company.where("company_id = ?", current_user.company_id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
    end
  end

  def show
    @company = Company.find(params[:id])
    @company_users = User.where("company_id = ?", current_user.company_id).count

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
      format.json { render json: @createdby }
    end
  end

  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create

    @company = Company.new(params[:company])
    @company.created_by = current_user

    respond_to do |format|
      if @company.save
        current_user.update_attribute(:company_id, @company.id)
        #user_signed_in
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end 
  end

  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

        private

    def signed_in_user
      unless user_signed_in?
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
