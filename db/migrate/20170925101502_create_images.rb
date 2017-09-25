class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :link
      t.integer :movie_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
