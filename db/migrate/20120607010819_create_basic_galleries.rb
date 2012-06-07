class CreateBasicGalleries < ActiveRecord::Migration
  def self.up
    Gallery.create :name => "Projetos"
    Gallery.create :name => "Obras"
    Gallery.create :name => "Estudos"
  end

  def self.down
    Gallery.delete_all
  end
end
