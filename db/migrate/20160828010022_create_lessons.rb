class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :lesson_date, null: false
      t.text :feedback
      t.text :notes
      t.belongs_to :user

      t.timestamps
    end
  end
end
