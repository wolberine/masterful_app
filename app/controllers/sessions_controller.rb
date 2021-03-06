class SessionsController < ApplicationController

  def new
  end

  def create
    parent = Parent.find_by(email: params[:session][:email].downcase)
    if parent && parent.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in parent
      #redirect_to root_url
      redirect_to :controller => "parents", :action => "show", :id => parent.id


      #redirect_back_or parent
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
