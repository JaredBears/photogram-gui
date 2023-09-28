class UserController < ApplicationController
  def index
    @users = User.all
    render({ :template => "user_templates/index" })
  end

  def show
    @the_user = User.where({ :username => params.fetch("path_username") }).at(0)
    @own_photos = @the_user.own_photos
    render({ :template => "user_templates/show" })
  end

  def create
    the_user = User.new
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

  def update
    the_user = User.find(params.fetch("path_id"))
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

  def destroy
    the_user = User.where({ :username => params.fetch("path_username") }).at(0)
    the_user.destroy
    redirect_to("/users")
  end

end
