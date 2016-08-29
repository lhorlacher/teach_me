class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lessons, dependent: :destroy

  validates_presence_of :first_name, :last_name

    # If user has no teacher, she's a teacher
  def teacher?
    teacher_id.nil?
  end

  # If user has a teacher, she's a student
  def student?
    !teacher?
  end

end
