class GalleryCategory < ActiveRecord::Base
  has_many :gallery_images, :dependent => :destroy
  
  validates_presence_of :title, :description, :visible
  validates_uniqueness_of :title
  
  def self.find_visible
    find_all_by_visible(true, :order => :title)
  end
  
end
