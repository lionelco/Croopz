class DefectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @defects = Defect.where("company_id = ?", current_user.company_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @defects }
    end
  end

  def show
    @defect = Defect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @defect }
    end
  end

  def new
      @defect = Defect.new
      @defect.target_id = params[:target_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @defect }
    end
  end

  def edit
    @defect = Defect.find(params[:id])
  end

  def create    
      @defect = Defect.new(params[:defect])
      @defect.user_id = current_user
      @defect.company_id = current_user.company_id

    respond_to do |format|
      if @defect.save
        format.html { redirect_to @defect, notice: 'Defect was successfully created.' }
        format.json { render json: @defect, status: :created, location: @defect }
      else
        format.html { render action: "new" }
        format.json { render json: @defect.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
      @defect = Defect.find(params[:id])

    respond_to do |format|
      if @defect.update_attributes(params[:defect])
        format.html { redirect_to defects_path, notice: 'Defect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @defect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @defect = Defect.find(params[:id])
    @defect.destroy

    respond_to do |format|
      format.html { redirect_to defects_url }
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
