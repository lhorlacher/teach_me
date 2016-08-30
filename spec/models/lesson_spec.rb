require 'rails_helper'

RSpec.describe Lesson, type: :model do
    it { should validate_presence_of(:lesson_date) }

  it { should belong_to(:user) }
  it { should have_many(:assignments) }

end
