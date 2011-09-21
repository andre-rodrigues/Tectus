# encoding: UTF-8
class Admin::GalleriesController < Admin::AdminController
  inherit_resources
  before_filter :set_page_title

  def index
    @galleries = Gallery.all.paginate(:page => params[:page], :per_page => 20)
  end


  def new
    @gallery = Gallery.new
    @gallery.images.build
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @gallery.images.build if @gallery.images.empty?
  end

  def create
    create!(:notice => "#{t('activerecord.models.gallery')} cadastrad#{t('activerecord.attributes.gallery.gender')} com sucessso.") do |sucess, failure|
      sucess.html { redirect_to admin_galleries_url }

      failure.html do
        @gallery.images.build
        render :action => :new
      end
    end
  end

  def update
    update!(:notice => "#{t('activerecord.models.gallery')} atualizad#{t('activerecord.attributes.gallery.gender')} com sucessso.") do |sucess, failure|
      sucess.html { redirect_to admin_galleries_url }

      failure.html do
        @gallery.images.build if @gallery.images.empty?
        render :action => :edit
      end
    end
  end

  def destroy
    destroy!(:notice => "#{t('activerecord.models.gallery')} excluíd#{t('activerecord.attributes.gallery.gender')} com sucessso.") { admin_galleries_url }
  end


  protected
    def set_page_title
      @page_title = t('activerecord.attributes.gallery.plural')
    end
end

