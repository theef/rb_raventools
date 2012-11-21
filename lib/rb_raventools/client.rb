module RavenTools

  require 'httparty'
  require 'json'
  
  class Client

    attr_accessor :api_key, :format
    
    def initialize(api_key)
      self.api_key = api_key
      @format = "json"
    end
    
    def profile_info
      method = "profile_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def engines
      method = "engines"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end

    def domains
      method = "domains"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def domain_info(domain)
      method = "domain_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def keywords(domain)
      method = "keywords"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def keywords_with_tags(domain)
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
  
  end
end