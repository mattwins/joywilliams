class GalleryImage < ActiveRecord::Base
  belongs_to :gallery_category
  
  validates_presence_of :title, :description, :visible
  validates_uniqueness_of :title
  
  PHOTO_SW = 240
  PHOTO_SH = 125
  PHOTO_NW = 800
  PHOTO_NH = 800
  
  has_attached_file :photo, 
                    :styles => { :medium => ["#{PHOTO_NW}x#{PHOTO_NH}>", :jpg],
                    :thumb => {:geometry => "#{PHOTO_SW}x#{PHOTO_SH}#", :processors => [:jcropper]}}
                    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']

  after_update :reprocess_photo, :if => :cropping?

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file photo.path(style)
  end
  
  def self.find_visible
    find_all_by_visible(true, :order => :title)
  end

  private
  
  def reprocess_photo
    photo.reprocess!
  end

end
