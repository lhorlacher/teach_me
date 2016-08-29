class Lesson < ApplicationRecord
	belongs_to :user
	has_many :assignments, dependent: :destroy

	validates_presence_of :lesson_date

end
