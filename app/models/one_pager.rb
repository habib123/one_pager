class OnePager < ActiveRecord::Base
	validates :patent_name, presence: true
	validates :single_patent_num, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	attr_accessor :email

end
