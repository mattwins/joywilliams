class GalleryImage < ActiveRecord::Base
  belongs_to :gallery_category
  
  validates_presence_of :title, :description, :url, :visible
  validates_uniqueness_of :title
  
  def self.find_visible
    find_all_by_visible(true, :order => :title)
  end
end
