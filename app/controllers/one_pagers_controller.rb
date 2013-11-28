class OnePagersController < ApplicationController

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
		if type_param[:type] == "patent"
			puts "one_pager is patent"
			@one_pager = OnePager.new(one_pager_patent_params)
			if @one_pager.save
				puts "one_pager saved"
				# TODO : Success
			else
				puts "Cannot save one pager"
				# TODO : Fail
				@type = "patent"
				render 'new', {:type => @type}
			end
		elsif type_param[:type] == "portfolio"
			puts "one_pager is portfolio"
			@one_pager = OnePager.new(one_pager_portfolio_params)
			if @one_pager.save
				puts "one_pager saved"
				# TODO : Success
			else
				puts "Cannot save one pager"
				# TODO : Fail
				@type = "portfolio"
				render 'new', {:type => @type}
			end
		elsif type_param[:type] == "patent_bulk"
			puts "one_pager is patent_bulk"
			@one_pager = OnePager.new(one_pager_patent_bulk_params)
			if @one_pager.save
				puts "one_pager saved"
				# TODO : Success
			else
				puts "Cannot save one pager"
				# TODO : Fail
				@type = "patent_bulk"
				render 'new', {:type => @type}
			end			
		elsif type_param[:type] == "company_tags"
			
		end
	end

	private

		def one_pager_patent_params
			params.require(:one_pager).permit(:patent_name, :single_patent_num, :email)
		end

		def one_pager_portfolio_params
			params.require(:one_pager).permit(:patent_name, :patent_list, :email)
		end

		def one_pager_patent_bulk_params
			params.require(:one_pager).permit(:patent_name, :patent_list, :email)
		end		

		def type_param
			params.require(:one_pager).permit(:type)
		end

end
