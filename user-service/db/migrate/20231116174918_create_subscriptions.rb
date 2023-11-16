class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.float :cost
      t.date :renews_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
