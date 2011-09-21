class ProjectsController < ApplicationController
  def index
    @project = Gallery.find(:first, :conditions => {:name => "Projetos"})
  end
end
