class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)
    # check if user can save
    if @user.save_and_subscribe
      # after we save a user, let's keep hold of that user.
      session[:user_id] = @user.id

      # let the user know they've signed up.
      flash[:success] = 'Welcome to Source!'

      redirect_to root_path
    else
      # render the new action (the view new.html.erb) again
      render 'new'
    end
  end

  private

  def form_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :subscription_plan, :stripe_token)
  end
end
