class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.boolean :read
      t.references :movie, foreign_key: true
      t.references :notiable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
