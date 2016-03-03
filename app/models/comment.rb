class Comment < ActiveRecord::Base
	belongs_to :user, inverse_of: :comments
	belongs_to :place, inverse_of: :comments

	validates :rating, presence: true

	RATING_MAP = {"Five Stars" => 5, "Four Stars" => 4, "Three Stars" => 3, "Two Stars" => 2, "One Star" => 1}
end