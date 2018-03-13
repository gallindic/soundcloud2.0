class Music < ActiveRecord::Base
    mount_uploader :file, FileUploader
end
