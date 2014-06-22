module SessionsHelper

  def sign_in(parent)
    remember_token = Parent.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    parent.update_attribute(:remember_token, Parent.digest(remember_token))
    self.current_parent = parent
  end

  def sign_out
    current_parent.update_attribute(:remember_token,
                                  Parent.digest(Parent.new_remember_token))
    cookies.delete(:remember_token)
    self.current_parent = nil
  end

  def signed_in?
    !current_parent.nil?
  end

  def signed_in_parent
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def current_parent=(parent)
    @current_parent = parent
  end

  def current_parent
    remember_token = Parent.digest(cookies[:remember_token])
    @current_parent ||= Parent.find_by(remember_token: remember_token)
  end

  def current_parent?(parent)
    parent == current_parent
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end



