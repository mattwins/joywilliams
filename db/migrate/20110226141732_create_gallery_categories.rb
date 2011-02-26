class CreateGalleryCategories < ActiveRecord::Migration
  def self.up
    create_table :gallery_categories do |t|
      t.string :title
      t.text :description
      t.boolean :visible
    end
  end

  def self.down
    drop_table :gallery_categories
  end
end
