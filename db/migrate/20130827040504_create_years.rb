class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :what_i_did
      t.string :lesson_or_story

      t.timestamps
    end
  end
end
