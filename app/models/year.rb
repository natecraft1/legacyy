class Year < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar
end
