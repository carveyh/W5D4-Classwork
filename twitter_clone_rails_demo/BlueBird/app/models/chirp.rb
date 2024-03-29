# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
	validates :body, presence: true
	validates :author_id, presence: true
	validate :body_too_long #CUSTOM VALIDATION IS INVOKED WITH #validate SINGULAR!!! NO S AT THE END!!!

	belongs_to :author,
		primary_key: :id,
		foreign_key: :author_id,
		class_name: :User

	has_many :likes,
		primary_key: :id,
		foreign_key: :chirp_id,
		class_name: :Like

	has_many :likers,
		through: :likes,
		source: :liker

	#create a custom validation
	def body_too_long
		if body && body.length > 140 #check if body exists, and the length
			errors.add(:body, "too long")
		end
	end
end
