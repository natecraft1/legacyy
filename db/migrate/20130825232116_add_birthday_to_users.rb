class AddBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :string
  end
end
