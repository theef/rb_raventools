module RavenTools

  require 'json'
  require 'httparty'
  
  class Client

    attr_accessor :api_key
    
    def initialize(api_key)
      self.api_key = api_key
      @format = "json"
    end

    def get_domains
      method = "domains"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&format=#{@format}&method=#{method}"
      response = HTTParty.get(raven_url)
      return response.body
    end
    
    def get_keywords(domain)
      method = "keywords"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&domain=#{domain}&format=#{@format}&method=#{method}"
      response = HTTParty.get(raven_url)
      return response.body
    end
  
  end
end