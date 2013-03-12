class OccurrencesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  #before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :edit, :update, :destroy]

  def index
    @occurrences = Occurrence.where("company_id = ?", current_user.company_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occurrences }
    end
  end

  def show
    @occurrence = Occurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occurrence }
    end
  end

  def new
      @occurrence = Occurrence.new
      @occurrence.defect_id = params[:defect_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occurrence }
    end
  end

  def edit
    @occurrence = Occurrence.find(params[:id])
  end

  def create
      @occurrence = Occurrence.new(params[:occurrence])
      @occurrence.user_id = current_user.id
      @occurrence.company_id = current_user.company_id
      @defect = Defect.find(@occurrence.defect_id)
      @target = Target.find(@defect.target_id) 
      @occurrence.target_id = @target.id

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to target_path(@target), notice: 'Occurrence was successfully created.' }
        format.json { render json: @occurrence, status: :created, location: @occurrence }
      else
        format.html { render action: "new" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    @occurrence = Occurrence.find(params[:id])
   
    respond_to do |format|
      if @occurrence.update_attributes(params[:occurrence])
        format.html { redirect_to @occurrence, notice: 'Occurrence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    respond_to do |format|
      format.html { redirect_to occurrences_path }
      format.json { head :no_content }
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
