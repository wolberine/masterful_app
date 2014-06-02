class ParentsController < ApplicationController
  before_action :signed_in_parent, only: [:index, :edit, :update, :destroy]
  before_action :correct_parent,   only: [:edit, :update]
  before_action :admin_parent,     only: :destroy

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.paginate(page: params[:page])
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @parent = Parent.find(params[:id])
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
    @parent = Parent.find(params[:id])
  end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      sign_in @parent
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(parent_params)
      flash[:success] = "Profile updated"
      redirect_to @parent
    else
      render 'edit'
    end
  end




  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    Parent.find(params[:id]).destroy
    flash[:success] = "Parent deleted."
    redirect_to parents_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    def signed_in_parent
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

   def correct_parent
      @parent= Parent.find(params[:id])
      redirect_to(root_url) unless current_parent?(@parent)
    end

    def admin_parent
      redirect_to(root_url) unless current_parent.admin?
    end
end
