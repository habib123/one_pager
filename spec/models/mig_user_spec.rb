require 'spec_helper'

describe MigUser do


  before do
    @mig_user = MigUser.new(email:"user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @mig_user }

 
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when password is not present" do
    before do
       @mig_user = MigUser.new( email: "user@example.com",
                     password: " ", password_confirmation: " ")
         end
  it { should_not be_valid }
  end
  describe "when password doesn't match confirmation" do
    before { @mig_user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @mig_user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @mig_user.email = invalid_address
        expect(@mig_user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @mig_user.email = valid_address
        expect(@mig_user).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @mig_user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "remember token" do
    before { @mig_user.save }
    its(:remember_token) { should_not be_blank }
  end

end
