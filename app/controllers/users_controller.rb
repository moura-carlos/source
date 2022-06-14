class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)
    # check if user can save
    if @user.save
      redirect_to root_path
    else
      # render the new action (the view new.html.erb) again
      render 'new'
    end
  end

  private

  def form_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
