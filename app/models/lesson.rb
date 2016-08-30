# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  lesson_date :date             not null
#  feedback    :text
#  notes       :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ApplicationRecord
	belongs_to :user
	has_many :assignments, dependent: :destroy

	validates_presence_of :lesson_date

end
