class CreateAverageCaches < ActiveRecord::Migration[5.1]
  def change
    create_table :average_caches do |t|
      t.integer :rater_id
      t.string :rateable_type
      t.integer :rateable_id
      t.float :avg

      t.timestamps
    end
  end
end
