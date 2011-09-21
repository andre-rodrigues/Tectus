# encoding: UTF-8
class Gallery < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  has_many :images, :as => :assetable, :class_name => 'GalleryImage', :dependent => :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:attachment].blank?  }, :allow_destroy => true

  validates_presence_of :name
end

