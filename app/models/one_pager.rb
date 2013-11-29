class OnePager < ActiveRecord::Base
	validates :patent_name, presence: true
	validates :single_patent_num, presence: true, :if => :should_validate_single_patent_num?
	validates :patent_list, presence: true, :if => :should_validate_patent_list?
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	attr_accessor :email , :patent_list , :report_type

	def should_validate_single_patent_num?
		report_type == "patent"
	end

	def should_validate_patent_list?
		report_type == "portfolio" || report_type == "patent_bulk"
	end	

end
