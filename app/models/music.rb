class Music < ActiveRecord::Base
    belongs_to :user
    
    mount_uploader :file, FileUploader
    mount_uploader :image, FileUploader
end
