class ItemsController < ApplicationController
  # checking that the user is logged in with the method in the application controller
  # unless the user is logged in, they cannot see the items.
  # the reason why we have direct access to #force_login is
  # because ItemsController inherits from ApplicationController
  # so it has access to its methods.
  # if this was a view, to use that - #force_login - method,
  # I would have to add it as a helper_method in the application
  # controller so that I would have access to it in both controllers and views.
  before_action :force_login

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
