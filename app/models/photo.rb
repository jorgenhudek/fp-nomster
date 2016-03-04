class Photo < ActiveRecord::Base
	belongs_to :place, inverse_of: :photos
  mount_uploader :image, ImageUploader
  validates :image, presence: :true
  validates :caption, length: {maximum: 140}
end