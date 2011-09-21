class GalleryImage < Asset
  before_save :set_dimensions

  has_attached_file :attachment,
                    :styles => {:admin_thumb => "94x71#", :original => "1280x1024>"},
                    :storage => Rails.env.production? ? :s3 : :filesystem,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => Rails.env.production? ? "/:attachment/:id/:style/:filename" : ":rails_root/public:url"

  protected
    def set_dimensions
      tempfile = self.attachment.queued_for_write[:original]

      unless tempfile.nil?
        dimensions = Paperclip::Geometry.from_file(tempfile)
        self.attachment_width = dimensions.width
        self.attachment_height = dimensions.height
      end
    end
end

