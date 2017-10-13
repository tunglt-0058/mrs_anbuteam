class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.integer :activity_type, null: false

      t.timestamps
    end
  end
end
