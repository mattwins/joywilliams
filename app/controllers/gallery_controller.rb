class GalleryController < ApplicationController
  def index
    @categories = GalleryCategory.find_visible
  end

  def show
    @category = GalleryCategory.find(params[:id])
    @images = @category.gallery_images.find_visible
  end

end
