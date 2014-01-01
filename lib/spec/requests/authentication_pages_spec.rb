require 'spec_helper'



  describe "signin" do
    before { visit mig_signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      #it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "after visiting another page" do
        #before { click_link "mig_signout" }
        #it { should_not have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:mig_user) { FactoryGirl.create(:mig_user) }
      before do
        fill_in "Email",    with: mig_user.email.upcase
        fill_in "Password", with: mig_user.password
       
        click_button "Sign in"
      end
    end

end
