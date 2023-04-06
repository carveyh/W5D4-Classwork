# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  chirp_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
	validates :liker_id, uniqueness: { scope: :chirp_id } #this means that within scope of chirp, the liker must be unique.
	# validates :chirp_id, uniqueness: { scope: :liker_id } #this would means that within scope of liker, the chirp must be unique.

	belongs_to :liker,
		primary_key: :id,
		foreign_key: :liker_id,
		class_name: :User

	belongs_to :chirp,
		primary_key: :id,
		foreign_key: :chirp_id,
		class_name: :Chirp
	
end
