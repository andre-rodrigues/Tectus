class ResearchesController < ApplicationController
  def index
    @research = Gallery.find(:first, :conditions => {:name => "Estudos"})
  end
end
