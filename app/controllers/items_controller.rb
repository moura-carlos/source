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
    # if there is a search, filter
    # otherwise, show all items.
    if params[:q].present?
      # this is where we search!
      @items = Item.where('lower(title) LIKE ?', "%#{params[:q].downcase}%")
    else
      # show all
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def download
    @item = Item.find(params[:id])
    require "down"
    tempfile = Down.download(@item.image.url)
    send_file tempfile.path, type: tempfile.content_type, disposition: 'attachment', filename: tempfile.original_filename
    # require 'open-uri'
    # url = @item.image.url
    # data = open(url).read
    # send_data data, disposition: 'attachment', filename: @item.image.identifier
  end
end
