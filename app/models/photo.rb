class Photo < ActiveRecord::Base
  belongs_to :post
  mount_uploader :image, PhotoUploader
end