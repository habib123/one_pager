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

		elsif type_param[:type] == "portfolio"

		elsif type_param[:type] == "patent_bulk"
			
		elsif type_param[:type] == "company_tags"
			
		end
		#@one_pager = OnePager.new(one_pager_params)
		puts "bef"
		puts @one_pager.email
		puts "aft"
		if @one_pager.save
			# TODO : Success
		else
			# TODO : Fail
			@type = "patent"
			render 'new', {:type => @type}
		end
	end

	private

		def one_pager_params
			params.require(:one_pager).permit(:patent_name, :single_patent_num, :email)
		end

		def type_param
			params.require(:one_pager).permit(:type)
		end

end
