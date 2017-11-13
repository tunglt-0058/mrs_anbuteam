class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.string :role, default: "Regular"
      t.string :sex, default: "Male"
      t.integer :new_notification, default: 0

      t.timestamps
    end
  end
end
