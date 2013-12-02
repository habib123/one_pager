class UsersController < ApplicationController

  def index
  	@user = User.new
  end

  def show
  end

  def new
  	@user = User.new
  end

end
