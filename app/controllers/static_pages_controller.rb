class StaticPagesController < ApplicationController
  def home
    @parent = current_parent
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
end
