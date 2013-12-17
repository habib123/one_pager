require 'spec_helper'

describe MigUser do


  before do
    @mig_user = MigUser.new(password:"foo", email: "user@example.com")
  end

  subject { @mig_user }

  it { should respond_to(:password) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when password is not present" do
    before { @mig_user.password = " " }
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

end
