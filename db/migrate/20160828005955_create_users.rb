class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.string :instrument
      t.string :status
      t.text :notes
      t.integer :teacher_id

      t.timestamps
    end
  end
end
