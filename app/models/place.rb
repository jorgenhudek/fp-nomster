class Place < ActiveRecord::Base
	belongs_to :user, inverse_of: :places
	has_many :comments, inverse_of: :place, dependent: :destroy
	has_many :photos, inverse_of: :place, dependent: :destroy

	validates :name, presence: true, length: {minimum: 4}
	validates :address, presence: true
	validates :description, presence: true

	geocoded_by :address
	after_validation :geocode
end