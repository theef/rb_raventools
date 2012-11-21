module RavenTools

  require 'httparty'
  require 'json'
  
  class Client

    attr_accessor :api_key
    
    def initialize(api_key)
      @@api_key = api_key
      @@format = "json"
      self.api_key = api_key
    end
    
    def profile_info
      method = "profile_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def engines
      method = "engines"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end

    def domains
      method = "domains"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def domain_info(domain)
      method = "domain_info"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def keywords(domain)
      method = "keywords"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def keywords_with_tags(domain)
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      return parsed_response
    end
    
    def tags(domain)
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      tags = []
      parsed_response.each do |keywords|
        tag_list = keywords['tags'].to_a
        unless tag_list.size < 1
          tag_list.each do |tag|
            unless tags.include? tag
              tags << tag
            end
          end 
        end
      end
      return tags
    end
    
    def tag_info(domain, tag)
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{self.api_key}&method=#{method}&format=#{@@format}&domain=#{domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      tag_info = [{ tag: tag }]
      keyword_list = []
      parsed_response.each do |keywords|
        tag_list = keywords['tags'].to_a
        if tag_list.include? tag
          keyword_list << keywords['keyword']
        end
      end
      tag_info << { keywords: keyword_list }
      return tag_info
    end
  
  end
end