class CreateMusics < ActiveRecord::Migration[5.1]
  def change
    create_table :musics do |t|
      t.string :link
      t.integer :movie_id

      t.timestamps
    end
  end
end
