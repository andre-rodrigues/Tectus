class BuildingsController < ApplicationController
  def index
    @building = Gallery.find(:first, :conditions => {:name => "Obras"})
  end
end
