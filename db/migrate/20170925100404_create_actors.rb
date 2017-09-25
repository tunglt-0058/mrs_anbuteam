class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :date_of_birth
      t.string :avatar

      t.timestamps
    end
  end
end
