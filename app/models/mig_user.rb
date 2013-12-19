class MigUser < ActiveRecord::Base 
  before_save { self.email = email.downcase }
  has_many :one_pagers
  #validates :password, presence: true ,length: { maximum: 16 }
  validates :password, length: { minimum: 6 },length: { maximum: 16 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,length: { maximum: 30 },  uniqueness: { case_sensitive: true }
  has_secure_password

  before_create :create_remember_token
 
  def MigUser.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def MigUser.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = MigUser.encrypt(MigUser.new_remember_token)
    end

end
