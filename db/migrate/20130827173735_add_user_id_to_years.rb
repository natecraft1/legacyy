class AddUserIdToYears < ActiveRecord::Migration
  def change
    add_column :years, :user_id, :integer
  end
end
