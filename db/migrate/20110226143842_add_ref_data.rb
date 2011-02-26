class AddRefData < ActiveRecord::Migration
  def self.up
    GalleryCategory.delete_all
    GalleryImage.delete_all
    GalleryCategory.create!(:title => 'Gallery Category 1',
                           :description => %{Pictures of cats},
                           :visible => true)
    GalleryCategory.create!(:title => 'Gallery Category 2',
                           :description => %{Pictures of dogs},
                           :visible => true)
    GalleryImage.create!(:title => 'A Picture of a Dog',
                        :description => %{This is an <strong>AWESOME</strong> picture of a dog. It's taken as it crashes into a retarded girl.},
                        :url => '/images/gallery/dog.jpg',
                        :visible => true,
                        :gallery_category_id => 2)
    GalleryImage.create!(:title => 'A Picture of a Cat',
                        :description => %{cats are <strong>AWESOME</strong>, so here's a picture of one. It ricks, ceiling cat agrees.},
                        :url => '/images/gallery/dog.jpg',
                        :visible => true,
                        :gallery_category_id => 1)
  end

  def self.down
    GalleryCategory.delete_all
    GalleryImage.delete_all
  end
end
