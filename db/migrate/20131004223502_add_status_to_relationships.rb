class AddStatusToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :status, :string
  end
end
