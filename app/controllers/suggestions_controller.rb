class SuggestionsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :admin_user,     only: [:new, :edit, :update, :destroy]

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    @suggestion.user_id = current_user
    @suggestion.company_id = current_user.company_id
    @target = Target.find(@suggestion.target_id) 

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to target_path(@target), notice: 'Suggestion was successfully created. The Owner will review it' }
        format.json { render json: @suggestion, status: :created, location: @suggestion }
      else
        format.html { render action: "new" }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  def index

    @suggestions = Suggestion.where("company_id = ?", current_user.company_id) # :user_id
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suggestions }
      format.xls #do
      #render :xls => @occurrences,
      #              :columns => [ :created_at ,:description, :target_id, :defect_id, :user_id ],
      #              :headers => %w[ Date Comment Process Defect User]
      #end
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

