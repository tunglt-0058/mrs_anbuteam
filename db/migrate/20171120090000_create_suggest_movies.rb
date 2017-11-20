class CreateSuggestMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :suggest_movies do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :movie_id, null: false
      t.string :content

      t.timestamps
    end
  end
end
