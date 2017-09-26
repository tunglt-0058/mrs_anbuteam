class CreateOverallAverages < ActiveRecord::Migration[5.1]
  def change
    create_table :overall_averages do |t|
      t.string :rateable_type
      t.integer :rateable_id
      t.float :overall_avg

      t.timestamps
    end
  end
end
