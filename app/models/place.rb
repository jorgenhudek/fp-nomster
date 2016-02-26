class Place < ActiveRecord::Base
	belongs_to :user, inverse_of: :places
	validates :name, presence: true
end