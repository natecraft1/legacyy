object @user
attributes :name, :email, :date_of_birth

child :years do
  attributes :what_i_did, :lesson_or_story
end