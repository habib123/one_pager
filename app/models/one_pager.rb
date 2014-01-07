class OnePager < ActiveRecord::Base
  has_and_belongs_to_many :one_pagers_tags
  has_one :one_pagers_patent_num
  belongs_to :mig_users
  belongs_to :users
  belongs_to :user_favorites
  self.inheritance_column = nil
	
	validates :patent_name, presence: true

	VALID_SINGLE_PATENT_NUM_REGEX = /\A(?:([A-Z]{2}(?:\d{7}|\d{11})[A-Z]\d))\z/

	validates :single_patent_num, presence: true, :if => :should_validate_single_patent_num? , format: { with: VALID_SINGLE_PATENT_NUM_REGEX }

	validates :company_name, presence: true, :if => :should_validate_company_name?

	#VALID_COMPANY_TAGS_LIST_REGEX = /(?:| , )([^,\s][^\,]*[^,\s]*)/
	VALID_COMPANY_TAGS_LIST_REGEX = /\A(?:(?:\A|\s*,\s*|\s*)([A-Za-z0-9_-]+)\b)+?\z/
	validates :tags_list, presence: true, :if => :should_validate_tags_list? , format: { with: VALID_COMPANY_TAGS_LIST_REGEX }
	
	VALID_PATENT_LIST_REGEX = /\A(?:(?:\A|\s*,\s*|\s*)([A-Z]{2}(?:\d{7}|\d{11})[A-Z]\d)\b)+?\z/
	validates :patent_list, presence: true, :if => :should_validate_patent_list? , format: { with: VALID_PATENT_LIST_REGEX }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	attr_accessor :email , :patent_list , :tags_list , :user_exists

	def should_validate_single_patent_num?
		type == "patent"
	end

	def should_validate_patent_list?
		type == "portfolio" || type == "patent_bulk"
	end	

	def should_validate_tags_list?
		type == "company_tags"
	end

	def should_validate_company_name?
		type == "company_tags"
	end

	def self.get_patent_one_pager(patent_number)
		OnePager.find_by_single_patent_num(patent_number)
	end

	def self.get_portfolio_one_pager(patents_list)
		patents_array = patents_list.split(/[^\w-]+/)
		patents_array.sort!
		patents_list = patents_array.join(',')
		one_pager_id = OnePagersPatentNum.group("one_pager_id").
						having("GROUP_CONCAT(patent_num ORDER BY patent_num ASC SEPARATOR ',') = ?",patents_list).
						order(created_at: :desc).
						pluck(:one_pager_id).
						first
		puts one_pager_id
		if (one_pager_id.nil?)
			nil
		else
			OnePager.find(one_pager_id)
		end

	end

	def self.get_patent_bulk_one_pager(patents_list)
		patents_array = patents_list.split(/[^\w-]+/)
		patents_array.sort!
		patents_list = patents_array.join(',')
		one_pager_id = OnePagersPatentNum.group("one_pager_id").
						having("GROUP_CONCAT(patent_num ORDER BY patent_num ASC SEPARATOR ',') = ?",patents_list).
						order(created_at: :desc).
						pluck(:one_pager_id).
						first
		puts one_pager_id
		if (one_pager_id.nil?)
			nil
		else
			OnePager.find(one_pager_id)
		end

	end

	def self.get_company_tags_one_pager(tags_list,company_name)
		tags_array = tags_list.split(/[^\w-]+/)
		tags_array.sort!
		tags_list = tags_array.join(',')
		ids = OnePagersTag.group("one_pager_id").
						having("GROUP_CONCAT(tag ORDER BY tag ASC SEPARATOR ',') = ?",tags_list).
						order(created_at: :desc).
						pluck(:one_pager_id)
		one_pager_id = OnePager.where("company_name = ? ", company_name).where(id: ids).pluck(:id).first
		if (one_pager_id.nil?)
			nil
		else
			OnePager.find(one_pager_id)
		end
	end	

	def self.updateLinks(id,html_link,pdf_link,img_link)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:html_link, html_link)
		one_pager.update_attribute(:pdf_link, pdf_link)
		one_pager.update_attribute(:img_link, img_link)
	end

	def self.updateOnePagerName(id,onePagerNewName)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:patent_name, onePagerNewName)
	end

	def self.updateOnePagerMigStatus(id,newStatus)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:mig_status, newStatus)
	end

	def self.updateOnePagerCreatedStatus(id,newStatus)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:created_status, newStatus)
	end

	def self.updateOnePagerEmailStatus(id,newStatus)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:email_status, newStatus)
	end

	def self.updateOnePagerComments(id,comments)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:comments, comments)
	end

	def self.updateOnePagerDate(id,date)
		one_pager = OnePager.find(id)
		one_pager.update_attribute(:date, date)
	end

end
