class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :user_picture
      t.date :date_of_birth
      t.string :role
      t.string :sex

      t.timestamps
    end
  end
end
