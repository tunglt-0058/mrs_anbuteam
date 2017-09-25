class CreateFavoriteActors < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_actors do |t|
      t.integer :user_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
