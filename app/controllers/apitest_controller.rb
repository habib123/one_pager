class ApitestController < ApplicationController

  #basic authentication
  http_basic_authenticate_with name: "master", password: "master123" #, except: [:login, :show]

  def index
  end

  def show
    if params[:id]=='patent'
      render 'patent'
    elsif params[:id]=='applicant'
      render 'applicant'
    elsif params[:id]=='portfolio'
      render 'portfolio'
    elsif params[:id]=='bulk'
      render 'bulk'
    end
  end

  def patent
    @pat = params[:patent]

    if @pat[:onepager_id]=='' || @pat[:patent_number]=='' || @pat[:onepager_name]==''
      flash[:error] = 'All fields are required.'
      render 'patent' and return
    end

    #raise @patent.inspect
    @patent = params[:patent]
    @res = Api.patent(@patent[:onepager_id], @patent[:patent_number], @patent[:onepager_name])
    #res = Api.patent('ONEPAGER_10099', 10099, 'onepager_name')
    #raise res.inspect
    render 'patentresult'
  end

  def applicant

    @pat = params[:applicant]
    if @pat[:onepager_id]=='' || @pat[:applicant_title]=='' || @pat[:tags]==''
      flash[:error] = 'All fields are required.'
      render 'applicant' and return
    end

    @applicant = params[:applicant]
    @res = Api.applicant(@applicant[:onepager_id], @applicant[:applicant_title], @applicant[:tags])
    #@res = Api.patent('ONEPAGER_10099', 10099, 'onepager_name')
    #raise res.inspect
    render 'applicantresult'
  end

  def portfolio

    @pat = params[:portfolio]
    if @pat[:onepager_id]=='' || @pat[:onepager_name]=='' || @pat[:patent_numbers]==''
      flash[:error] = 'All fields are required.'
      render 'portfolio' and return
    end

    @portfolio = params[:portfolio]
    @res = Api.portfolio(@portfolio[:onepager_id], @portfolio[:onepager_name], @portfolio[:patent_numbers])
    #res = Api.patent('ONEPAGER_10099', 10099, 'onepager_name')
    #raise res.inspect
    render 'portfolioresult'
  end

  def bulk

    @pat = params[:bulk]
    if @pat[:onepager_id]=='' || @pat[:onepager_name]=='' || @pat[:patent_numbers]==''
      flash[:error] = 'All fields are required.'
      render 'bulk' and return
    end

    @bulk = params[:bulk]
    @res = Api.bulk(@bulk[:onepager_id], @bulk[:onepager_name], @bulk[:patent_numbers])
    #res = Api.patent('ONEPAGER_10099', 10099, 'onepager_name')
    #raise res.inspect
    render 'bulkresult'
  end

end
