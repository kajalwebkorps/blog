class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :posts, dependent: :destroy
	include Visible
end
