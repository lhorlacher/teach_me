# == Schema Information
#
# Table name: assignments
#
#  id            :integer          not null, primary key
#  book          :string           not null
#  title         :string
#  page          :integer
#  per_day       :integer
#  days_per_week :integer
#  notes         :text
#  plays         :integer
#  lesson_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Assignment < ApplicationRecord
	belongs_to :lesson
	validates_presence_of :book
end
