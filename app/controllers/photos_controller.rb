class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    @id = photo.id
    photo.destroy
    respond_to :js
  end
end
