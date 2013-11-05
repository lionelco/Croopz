class OccurrencesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user,     only: [:new, :edit, :update, :destroy]

  def index

    @occurrences = Occurrence.where("company_id = ?", current_user.company_id) # :user_id
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occurrences }
      format.xls #do
      #render :xls => @occurrences,
      #              :columns => [ :created_at ,:description, :target_id, :defect_id, :user_id ],
      #              :headers => %w[ Date Comment Process Defect User]
      #end
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
      @target = Target.find(@occurrence.target_id) 

      if @occurrence.defect_id != nil
        @defect = Defect.find(@occurrence.defect_id)
      end

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to target_path(@target), notice: 'Occurrence was successfully created.' }
        format.json { render json: @occurrence, status: :created, location: @occurrence }
      else
        format.html { redirect_to root_path, notice: 'Occurrence WAS NOT created.'  }
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

  def remove_all
    @target_occurrences = Occurrence.where("company_id = ?", current_user.company_id)
    @target_occurrences.delete_all
    flash[:notice] = "You have removed all occurrences collected in your company !"
    redirect_to targets_path
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
