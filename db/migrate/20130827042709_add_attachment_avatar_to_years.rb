class AddAttachmentAvatarToYears < ActiveRecord::Migration
  def self.up
    change_table :years do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :years, :avatar
  end
end
