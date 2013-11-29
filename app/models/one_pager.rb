class OnePager < ActiveRecord::Base
	validates :patent_name, presence: true

	validates :single_patent_num, presence: true, :if => :should_validate_single_patent_num?

	validates :company_name, presence: true, :if => :should_validate_company_name?

	VALID_COMPANY_TAGS_LIST_REGEX = /(?:| , )([^,\s][^\,]*[^,\s]*)/
	validates :tags_list, presence: true, :if => :should_validate_tags_list? , format: { with: VALID_COMPANY_TAGS_LIST_REGEX}
	
	VALID_PATENT_LIST_REGEX = /(?:^| , )([A-Z]{2}(?:\d{7}|\d{11})[A-Z]\d)/
	validates :patent_list, presence: true, :if => :should_validate_patent_list? , format: { with: VALID_PATENT_LIST_REGEX }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	attr_accessor :email , :patent_list , :report_type , :tags_list

	def should_validate_single_patent_num?
		report_type == "patent"
	end

	def should_validate_patent_list?
		report_type == "portfolio" || report_type == "patent_bulk"
	end	

	def should_validate_tags_list?
		report_type == "company_tags"
	end

	def should_validate_company_name?
		report_type == "company_tags"
	end

end
