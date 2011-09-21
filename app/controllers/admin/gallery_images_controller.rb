class Admin::GalleryImagesController < Admin::AdminController
  def destroy
    @attachment = GalleryImage.find(params[:id])
    @attachment.destroy

    redirect_to(edit_admin_gallery_path(params[:gallery_id]))
  end
end

