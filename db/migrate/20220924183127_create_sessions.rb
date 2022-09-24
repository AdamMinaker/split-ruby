class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.integer :weight
      t.integer :reps
      t.belongs_to :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
