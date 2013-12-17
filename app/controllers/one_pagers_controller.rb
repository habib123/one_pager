class OnePagersController < ApplicationController

	MIG_EMAIL = "munichinnovationgmbh@gmail.com"
	
	def show
		puts "Entered show"
		@one_pager = OnePager.find(params[:id])
	end

	def new
		puts "new start"
		@one_pager = OnePager.new

		@type = params[:report]
		if @type == "patent"
			# Might be removed
		else
			# Pending for the rest types of one pagers
		end
		if @type.nil?
			render 'index'
		end
		puts "new end"
	end

	def create
		puts "Create started"
		@type = type_param[:type]

		if user_exists_param[:user_exists] == "true"
			puts "User exists"
			registered_user = true
			user = User.find_by_email(email_param[:email])
		else
			puts "User does not exist"
			registered_user = false
			user = AnonymousUser.find_by_email(email_param[:email])
		end

		if user.nil? || user.allowedToCreateOnePager?
			
			if @type == "patent"
				puts "one_pager is patent"
				@one_pager = OnePager.new(one_pager_patent_params)

				if @one_pager.valid?
					if user.nil?
						user = AnonymousUser.createAnonUser(@one_pager.email)
					end
					@existing_one_pager = OnePager.get_patent_one_pager(@one_pager.single_patent_num)
					if (!@existing_one_pager.nil?)
						puts "one_pager exists"
						user.updateUserCounter
						redirect_to @existing_one_pager
					else
						@one_pager.user_id = user.id
						@one_pager.mig_status = "Pending"
						@one_pager.created_status = false
						if @one_pager.save
							puts "one_pager saved"
							user.updateUserCounter
							MigMailer.new_one_pager(MIG_EMAIL,request.host_with_port,@one_pager.id.to_s).deliver
							redirect_to @one_pager
						else
							puts "Cannot save one pager"
							# TODO : Fail
							render 'new'
						end
					end
				else
					puts "One pager is not valid"
					# TODO : Fail
					render 'new'
				end

			elsif @type == "portfolio"
				puts "one_pager is portfolio"
				@one_pager = OnePager.new(one_pager_portfolio_params)

				if @one_pager.valid?
					if user.nil?
						user = AnonymousUser.createAnonUser(@one_pager.email)
					end
					@existing_one_pager = OnePager.get_portfolio_one_pager(@one_pager.patent_list)
					if (!@existing_one_pager.nil?)
						puts "one_pager exists"
						user.updateUserCounter
						redirect_to @existing_one_pager
					else
						@one_pager.user_id = user.id
						@one_pager.mig_status = "Pending"
						@one_pager.created_status = false
						if @one_pager.save
							save_patent_list(@one_pager.patent_list,@one_pager.id)
							puts "one_pager saved"
							user.updateUserCounter
							MigMailer.new_one_pager(MIG_EMAIL,request.host_with_port,@one_pager.id.to_s).deliver
							redirect_to @one_pager
						else
							puts "Cannot save one pager"
							# TODO : Fail
							render 'new'
						end
					end
				else
					puts "One pager is not valid"
					# TODO : Fail
					render 'new'
				end

			elsif @type == "patent_bulk"
				puts "one_pager is patent_bulk"
				@one_pager = OnePager.new(one_pager_patent_bulk_params)

				if @one_pager.valid?
					if user.nil?
						user = AnonymousUser.createAnonUser(@one_pager.email)
					end
					@existing_one_pager = OnePager.get_patent_bulk_one_pager(@one_pager.patent_list)
					if (!@existing_one_pager.nil?)
						puts "one_pager exists"
						user.updateUserCounter
						redirect_to @existing_one_pager
					else
						@one_pager.user_id = user.id
						@one_pager.mig_status = "Pending"
						@one_pager.created_status = false
						if @one_pager.save
							save_patent_list(@one_pager.patent_list,@one_pager.id)
							puts "one_pager saved"
							user.updateUserCounter
							MigMailer.new_one_pager(MIG_EMAIL,request.host_with_port,@one_pager.id.to_s).deliver
							redirect_to @one_pager
						else
							puts "Cannot save one pager"
							# TODO : Fail
							render 'new'
						end
					end
				else
					puts "One pager is not valid"
					# TODO : Fail
					render 'new'
				end			
			
			elsif @type == "company_tags"
				puts "one_pager is company_tags"
				@one_pager = OnePager.new(one_pager_company_tags_params)
				if @one_pager.valid?
					if user.nil?
						user = AnonymousUser.createAnonUser(@one_pager.email)
					end
					@existing_one_pager = OnePager.get_company_tags_one_pager(@one_pager.tags_list,@one_pager.company_name)
					if (!@existing_one_pager.nil?)
						puts "one_pager exists"
						user.updateUserCounter
						redirect_to @existing_one_pager
					else
						@one_pager.user_id = user.id
						@one_pager.mig_status = "Pending"
						@one_pager.created_status = false
						if @one_pager.save
							puts "one_pager saved"
							user.updateUserCounter
							MigMailer.new_one_pager(MIG_EMAIL,request.host_with_port,@one_pager.id.to_s).deliver
							save_tags_list(@one_pager.tags_list,@one_pager.id)
							redirect_to @one_pager
						else
							puts "Cannot save one pager"
							# TODO : Fail
							render 'new'
						end
					end
				else
					puts "One pager is not valid"
					# TODO : Fail
					render 'new'
				end							
			end			
		else
			flash.now[:error] = 'You are not allowed to generate more One Pagers'
			@one_pager = OnePager.new
      		render 'new'
		end

	end

	private

		def save_patent_list(patents_list,one_pager_id)
			patents_array = patents_list.split(/[^\w-]+/)
			hash_array = []
			patents_array.each { |x| hash_array << {one_pager_id: one_pager_id, patent_num:x} }
			OnePagersPatentNum.create(hash_array)
		end

		def save_tags_list(tags_list,one_pager_id)
			tags_array = tags_list.split(/[^\w-]+/)
			hash_array = []
			tags_array.each { |x| hash_array << {one_pager_id: one_pager_id, tag:x} }
			OnePagersTag.create(hash_array)
		end

		def one_pager_patent_params
			params.require(:one_pager).permit(:patent_name, :single_patent_num, :email, :type)
		end

		def one_pager_portfolio_params
			params.require(:one_pager).permit(:patent_name, :patent_list, :email, :type)
		end

		def one_pager_patent_bulk_params
			params.require(:one_pager).permit(:patent_name, :patent_list, :email, :type)
		end		

		def one_pager_company_tags_params
			params.require(:one_pager).permit(:patent_name, :company_name, :tags_list, :email, :type)
		end

		def type_param
			params.require(:one_pager).permit(:type)
		end

		def user_exists_param
			params.require(:one_pager).permit(:user_exists)
		end

		def email_param
			params.require(:one_pager).permit(:email)
		end

end
