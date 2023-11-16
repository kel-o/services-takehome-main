class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.date :starts_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
