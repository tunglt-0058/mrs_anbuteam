class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
