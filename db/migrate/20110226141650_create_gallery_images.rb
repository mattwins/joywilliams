class CreateGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :gallery_images do |t|
      t.string :title
      t.text :description
      t.string :url
      t.boolean :visible
      t.integer :gallery_category_id
    end
  end

  def self.down
    drop_table :gallery_images
  end
end
