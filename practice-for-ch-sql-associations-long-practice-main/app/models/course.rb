# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    # validates :prereq_id, presence: true
    has_many :enrollments,
        class_name: :Enrollment,
        primary_key: :id,
        foreign_key: :course_id

    has_many :enrolled_students, 
        through: :enrollments,
        source: :student 

    belongs_to :prerequisite,
        class_name: :Course, 
        primary_key: :id, 
        foreign_key: :prereq_id,
        optional: true

    belongs_to :instructor, 
        class_name: :User,
        primary_key: :id,
        foreign_key: :instructor_id
end
