class Place < ActiveRecord::Base
	belongs_to :user, inverse_of: :places
	validates :name, presence: true, length: {minimum: 4}
	validates :address, presence: true
	validates :description, presence: true
end