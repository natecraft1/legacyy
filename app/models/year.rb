class Year < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar,
	# , :default_url => "/assets/missing.png",
	# :storage => :s3,
 #  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path => "wordsbond/:attachment/:id/:style.:extension"
  # :bucket => "legacyy"
  validate :any_present?

  def any_present?
    if %w(what_i_did lesson_or_story).all?{|attr| self[attr].blank?}
      errors[:base] << "At least one field must be present"
    end
  end

end
