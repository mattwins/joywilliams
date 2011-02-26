class GalleryImage < ActiveRecord::Base
  belongs_to :gallery_category
  
  validates_presence_of :title, :description, :visible
  validates_uniqueness_of :title
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def self.find_visible
    find_all_by_visible(true, :order => :title)
  end
end
