class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :rater_id
      t.string :rateable_type
      t.string :rateable_id
      t.float :stars
      t.string :dimension

      t.timestamps
    end
  end
end
