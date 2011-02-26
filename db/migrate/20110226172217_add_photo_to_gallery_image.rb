class AddPhotoToGalleryImage < ActiveRecord::Migration
  def self.up
    add_column :gallery_images, :photo_file_name,    :string
    add_column :gallery_images, :photo_content_type, :string
    add_column :gallery_images, :photo_file_size,    :integer
    add_column :gallery_images, :photo_updated_at,   :datetime
    remove_column :gallery_images, :url
  end

  def self.down
    remove_column :gallery_images, :photo_file_name
    remove_column :gallery_images, :photo_content_type
    remove_column :gallery_images, :photo_file_size
    remove_column :gallery_images, :photo_updated_at
  end
end
