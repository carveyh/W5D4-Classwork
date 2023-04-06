# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  email                 :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  political_affiliation :string           not null
#  age                   :integer          not null
#

#Note: no need to explicitly require byebug or rails, since Rails will give global access to both.

class User < ApplicationRecord # < ActiveRecord::Base
	validates :username, :email, presence: true, uniqueness: true	

	has_many :chirps,
		primary_key: :id,
		foreign_key: :author_id,
		class_name: :Chirp

	has_many :likes,
		primary_key: :id,
		foreign_key: :liker_id,
		class_name: :Like

	has_many :liked_chirps,
		through: :likes,
		source: :chirp #semantically, the "source of our result after going through the join table"

	has_many :liker_who_liked_the_chirps_it_likes, #Troll method, just references back to self lol
		through: :likes,
		source: :liker
end
