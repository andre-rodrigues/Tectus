class GalleryImage < Asset
  before_save :set_dimensions

  has_attached_file :attachment,
                    :styles => { :admin_thumb => "94x61#", :original => "1280x1024>" },
                    :storage => Rails.env.production? ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET'],
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    },
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

