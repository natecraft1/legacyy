class ChangeColumnsWhatAnLesson < ActiveRecord::Migration
  def change
  		change_column :years, :what_i_did, :text
  		change_column :years, :lesson_or_story, :text
  end
end
