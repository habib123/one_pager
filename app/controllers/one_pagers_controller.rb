class OnePagersController < ApplicationController

	def new
		@one_pager = OnePager.new

		@partial = params[:report]
		if @partial == "patent"
			@one_pager.patent_name = "My Report"
			@one_pager.single_patent_num = "US 6128685 A"
		else
			# Pending for the rest types of one pagers
		end
		if @partial.nil?
			render 'index'
		end
	end

	def create
		puts "Create started"
		@one_pager = OnePager.new(one_pager_params)
		@one_pager.save
	end

	private

		def one_pager_params
			params.require(:one_pager).permit(:patent_name, :single_patent_num, :email)
		end

end
