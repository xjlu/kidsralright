class AvatarUploader < PictureUploader

  process :resize_to_fill => [50, 50]

end