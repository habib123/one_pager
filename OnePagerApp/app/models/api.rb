
require 'net/http'

class Api

  require 'rest_client'

  # define web service credentials
  USERNAME = 'moinul'
  PASSWORD = 'bcp006'
  API_BASE_URL = 'http://amigos-staging.munich-innovation.com/onepagers'

  # @param [String] onepager_id
  # @param [String] patent_num
  # @param [String] onepager_name
  def self.patent(onepager_id , patent_num, onepager_name )

    uri = "#{API_BASE_URL}/patent.json?pid=#{onepager_id}&no=#{patent_num}&name=#{onepager_name}"
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    response = rest_resource.get
    res = JSON.parse(response, :symbolize_names => true)
    if response.code == 200
      res[:statuscode] = response.code
      res[:status] = 'success'
      return res
      #raise @return_res.inspect
    else
      res[:statuscode] = response.code
      res[:status] = 'error'
      return res
      #raise @return_res.inspect
    end

    #url = URI.parse('http://amigos-staging.munich-innovation.com/onepagers/patent.json')
    #url = URI.parse('http://localhost:3001/api/patent.json')
    #http = Net::HTTP.new(url.host, url.port)
    #response = http.request_get('http://amigos-staging.munich-innovation.com/onepagers/patent.json?pid=5')
    #response = http.request_get('http://localhost:3001/api/patent.json?a=10&b=20&c=80')
    #@products = JSON.parse(response.body)

    #render :text => response

    #raise products.inspect

    #return response

  end

  # @param [String] onepager_id
  # @param [String] applicant_title
  # @param [String] tags
  def self.applicant(onepager_id, applicant_title, tags)

    uri = "#{API_BASE_URL}/applicant.json?pid=#{onepager_id}&title=#{applicant_title}&tags=#{tags}"
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    response = rest_resource.get
    res = JSON.parse(response, :symbolize_names => true)
    if response.code == 200
      res[:statuscode] = response.code
      res[:status] = 'success'
      return res
      #raise @return_res.inspect
    else
      res[:statuscode] = response.code
      res[:status] = 'error'
      return res
      #raise @return_res.inspect
    end

  end

  # @param [String] onepager_id
  # @param [String] onepager_name
  # @param [String] patent_nums
  def self.portfolio(onepager_id, onepager_name, patent_nums)

    uri = "#{API_BASE_URL}/portfolio.json?pid=#{onepager_id}&nos=#{patent_nums}&name=#{onepager_name}"
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    response = rest_resource.get
    res = JSON.parse(response, :symbolize_names => true)
    if response.code == 200
      res[:statuscode] = response.code
      res[:status] = 'success'
      return res
      #raise @return_res.inspect
    else
      res[:statuscode] = response.code
      res[:status] = 'error'
      return res
      #raise @return_res.inspect
    end

  end

  # @param [String] onepager_id
  # @param [String] onepager_name
  # @param [String] patent_nums
  def self.bulk(onepager_id, onepager_name, patent_nums)
    uri = "#{API_BASE_URL}/bulk.json?pid=#{onepager_id}&nos=#{patent_nums}&name=#{onepager_name}"
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    response = rest_resource.get
    res = JSON.parse(response, :symbolize_names => true)
    if response.code == 200
      res[:statuscode] = response.code
      res[:status] = 'success'
      return res
      #raise @return_res.inspect
    else
      res[:statuscode] = response.code
      res[:status] = 'error'
      return res
      #raise @return_res.inspect
    end
  end

end