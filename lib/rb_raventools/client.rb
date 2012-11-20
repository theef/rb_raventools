module RavenTools

  require 'httparty'
  require 'json'
  require 'nokogiri'
  
  class Client

    attr_accessor :api_key
    
    def initialize(api_key)
      self.api_key = api_key
    end

    def domains(options={})
      format = options[:format] ||= "json"
      method = "domains"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&format=#{format}&method=#{method}"
      response = HTTParty.get(raven_url)
      if format == "xml"
        parsed_response = Nokogiri::XML(response.body).domains_to_hash
      else
        parsed_response = JSON.parse(response.body)
      end
      return parsed_response
    end
    
    def keywords(domain, options={})
      method = "keywords"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&domain=#{domain}&format=#{@format}&method=#{method}"
      response = HTTParty.get(raven_url)
      return response
    end
    
    def engines(options={})
      method = "engines"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}"
      response = HTTParty.get(raven_url)
      response.body
    end
    
    def profile_info(options={})
      method = "profile_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}"
      response = HTTParty.get(raven_url)
      response.body
    end
    
    def domain_info(domain, options={})
      method = "domain_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      response.body
    end
  
  end
end