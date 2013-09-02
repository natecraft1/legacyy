class AddYearToYear < ActiveRecord::Migration
  def change
    add_column :years, :year, :string
  end
end
