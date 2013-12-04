class OnePagersController < ApplicationController

	
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
		if @type == "patent"
			puts "one_pager is patent"
			@one_pager = OnePager.new(one_pager_patent_params)

			if @one_pager.valid?
				@existing_one_pager = OnePager.get_patent_one_pager(@one_pager.single_patent_num)
				if (!@existing_one_pager.nil?)
					puts "one_pager exists"
					redirect_to @existing_one_pager
				else
					if @one_pager.save
						puts "one_pager saved"
						# TODO : Success
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
				@existing_one_pager = OnePager.get_portfolio_one_pager(@one_pager.patent_list)
				if (!@existing_one_pager.nil?)
					puts "one_pager exists"
					redirect_to @existing_one_pager
				else
					if @one_pager.save
						puts "one_pager saved"
						# TODO : Success
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
			if @one_pager.save
				puts "one_pager saved"
				# TODO : Success
			else
				puts "Cannot save one pager"
				# TODO : Fail
				render 'new'
			end			
		elsif @type == "company_tags"
			puts "one_pager is company_tags"
			@one_pager = OnePager.new(one_pager_company_tags_params)
			if @one_pager.save
				puts "one_pager saved"
				# TODO : Success
			else
				puts "Cannot save one pager"
				# TODO : Fail
				render 'new'
			end					
		end
	end

	private

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

end
