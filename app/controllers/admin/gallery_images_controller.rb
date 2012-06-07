class Admin::GalleryImagesController < Admin::AdminController
  inherit_resources
  
  def edit
    @attachment = GalleryImage.find(params[:id])
  end
  
  def update
    update!(:notice => "#{t('activerecord.models.gallery')} atualizad#{t('activerecord.attributes.gallery.gender')} com sucessso.") do |sucess, failure|
      sucess.html { redirect_to admin_galleries_url }
      
      failure.html do
        render :action => :edit
      end
    end
  end

  def destroy
    @attachment = GalleryImage.find(params[:id])
    @attachment.destroy

    redirect_to(edit_admin_gallery_path(params[:gallery_id]))
  end
end

