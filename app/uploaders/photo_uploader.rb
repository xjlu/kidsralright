class PhotoUploader < PictureUploader

  def timeline
    process :resize_to_fit => [500, 375] # timeline photo size
  end
end