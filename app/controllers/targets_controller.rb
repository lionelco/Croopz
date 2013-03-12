class TargetsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  #before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]

  def index
    @targets = Target.where("company_id = ?", current_user.company_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @targets }
    end
  end

  def show
    @target = Target.find(params[:id])
    @defects = Defect.where("target_id = ?", @target.id)
    @occurrence = Occurrence.new
    @suggestion = Suggestion.new
    @suggestion.target_id = @target.id
    
    a1 = [] 
    a2 = [] 
    @defects.each do |d|

      a1 << d.name

      if current_user.admin?
        a2 << Occurrence.where("defect_id = ?", d.id).count
      else
        a2 << Occurrence.where("defect_id = ? AND user_id = ?", d.id, current_user.id).count
      end
    end

    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "bar"
      f.options[:chart][:inverted] = true
      f.options[:legend][:layout] = "horizontal"
      f.options[:xAxis][:categories] =  a1
      f.series(:name=> @target.name , :data=> a2 )
    end

  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @target }
   end
end

  def new
      @target = Target.new
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target }
    end
  end

  def edit
    @target = Target.find(params[:id])
  end

  def create
      @target = Target.new(params[:target])
      @target.user_id = current_user
      @target.company_id = current_user.company_id

    respond_to do |format|
      if @target.save
        format.html { redirect_to targets_path , notice: 'Process was successfully created.'  }
        format.json { render json: @target, status: :created, location: @target }
      else
        format.html { render action: "new" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      @target = Target.find(params[:id])

    respond_to do |format|
      if @target.update_attributes(params[:target])
        format.html { redirect_to targets_path, notice: 'Process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to targets_path }
      format.json { head :no_content }
    end
  end

  def remove_all
    Occurrences.delete_all(:target_id => @target.id)
    flash[:notice] = "You have removed all occurrences!"
    redirect_to targets_path
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
