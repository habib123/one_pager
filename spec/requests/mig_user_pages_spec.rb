require 'spec_helper'

describe "Mig_User pages" do

  subject { page }

  describe "profile page" do
    let(:mig_user) { FactoryGirl.create(:mig_user) }
    before { visit mig_user_path(mig_user) }

    it { should have_content(mig_user.email) }
  end

  describe "mig_signup page" do

    before { visit mig_signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(MigUser, :count)
      end
    end

    describe "with valid information" do
      before do
        #fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        #fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(MigUser, :count).by(1)
      end
    end
  end

end
