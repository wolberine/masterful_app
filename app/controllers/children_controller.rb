class ChildrenController < ApplicationController
  before_action :signed_in_parent

  def create
    @child = current_parent.children.build(child_params)
    if @child.save
      flash[:success] = "Child created!"
      redirect_to show_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @child = Child.find(params[:id])
    if @child.present?
      @child.destroy
    end
    redirect_to root_url
  end

  private

    def child_params
      params.require(:child).permit(:name)
    end

    def correct_parent
      @child = current_parent.children.find_by(id: params[:id])
      redirect_to root_url if @child.nil?
    end

end
