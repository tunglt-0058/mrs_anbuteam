class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :link
      t.integer :movie_id

      t.timestamps
    end
  end
end
