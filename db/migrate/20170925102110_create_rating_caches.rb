class CreateRatingCaches < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_caches do |t|
      t.string :cacheable_type
      t.integer :cacheable_id
      t.float :avg
      t.integer :qty
      t.string :dimension

      t.timestamps
    end
  end
end
