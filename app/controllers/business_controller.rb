class BusinessController < ApplicationController
  WillPaginate.per_page = 7

#CREATE THE MAP VIEW!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#UNDERSTAND STRONG PARAMMMMMMSSSSSSS!!!!!!!!!!!!


  def index
    @businesses = Business.paginate(page: params[:page])
  end

  def new
    @business = Business.new
  end

  def destroy
    Business.find(params[:id]).destroy
    flash[:success] = "Business data deleted."
    #redirect_to businesses_url
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end  

  def update
    @business = business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = "Profile updated"
      redirect_to @business
    else
      render 'edit'
    end
  end

  def create
    @business = Business.new(business_params)    
    if @business.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @business #redirects to user show page, short hand
    else
      render 'new'
    end
  end

  private

    def business_params
      params.require(:business).permit(:name, :address)
    end
end
