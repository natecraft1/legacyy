class Year < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar
	validates_uniqueness_of :year, :scope => :user
  validate :any_present?

  def any_present?
    if %w(what_i_did lesson_or_story).all?{|attr| self[attr].blank?}
      errors[:base] << "At least one field must be present"
    end
  end

end
