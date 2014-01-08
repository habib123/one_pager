class AnonymousUser < ActiveRecord::Base
  has_many :one_pagers

	def updateUserCounter
		self.update(counter: self.counter+=1)
	end

	def self.createAnonUser(email)
		AnonymousUser.create(email: email , counter: 0)
	end

	def allowedToCreateOnePager?
		if self.counter >= 3
			false
		else
			true
		end
	end
end
