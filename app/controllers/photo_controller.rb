class PhotoController < ApplicationController

  def index
    @photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    @the_photo = Photo.where({ :id => params.fetch("path_id") }).at(0)
    @the_user = @the_photo.poster
    render({ :template => "photo_templates/show" })
  end

  def create
    the_photo = Photo.new
    the_user = User.find(params.fetch("query_user_id"))
    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")
    the_photo.owner_id = the_user.id
    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end

  def update
    the_photo = Photo.find(params.fetch("path_id"))
    the_photo.image = params.fetch("query_image")
    the_photo.caption = params.fetch("query_caption")
    the_photo.save
    redirect_to("/photos/#{the_photo.id}")
  end

  def destroy
    the_photo = Photo.find(params.fetch("path_id"))
    the_photo.destroy
    redirect_to("/photos")
  end

  def comment
    the_comment = Comment.new
    the_comment.photo_id = params.fetch("path_id")
    the_comment.author_id = params.fetch("query_author_id")
    the_comment.body = params.fetch("query_body")
    the_comment.save
    redirect_to("/photos/#{the_comment.photo_id}")
  end

  
end
