class OnePager < ActiveRecord::Base

	def email
		puts "email getter called"
		#@user = AnonymousUser.find(OnePager.find_by_user_id(self.user_id))
		#@user.email
	end

	def email=(newEmail)
		puts "email setter called"
		@user = AnonymousUser.find_by_email(newEmail)
		if @user.nil?
			puts "new User found"
			@user = AnonymousUser.new(email: @newEmail)
			@user.counter = 0
			@user.save
		else
			puts "Existing User"
		end
	end
end
