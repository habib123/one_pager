class MigUser < ActiveRecord::Base 
  before_save { self.email = email.downcase }
  has_many :one_pagers
  validates :password, presence: true ,length: { maximum: 16 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,length: { maximum: 30 },  uniqueness: { case_sensitive: true }
  
end
