class Music < ActiveRecord::Base
    belongs_to :user
    belongs_to :genre
    
    mount_uploader :file, FileUploader
    mount_uploader :image, FileUploader
    
    acts_as_votable
end
