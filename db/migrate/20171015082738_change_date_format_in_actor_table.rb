class ChangeDateFormatInActorTable < ActiveRecord::Migration[5.1]
  def change
    change_column :actors, :date_of_birth, :datetime
  end
end
