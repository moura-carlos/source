class AccountsController < ApplicationController
  def edit
    # @current_user comes from application controller
    @user = @current_user
  end

  def update
    @user = @current_user

    if @user.update_with_stripe(form_params)
      flash[:success] = 'Your account has been updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    # deletes and unsubscribes (from Stripe and the database)
    @current_user.destroy_and_unsubscribe

    # remove the subscription
    # delete the current user
    # remove the session
    reset_session
    # redirect to home page
    redirect_to root_path
  end

  private
  def form_params
    params.require(:user).permit(:subscription_plan)
  end
end
