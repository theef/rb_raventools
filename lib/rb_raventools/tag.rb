module RavenTools

  require 'httparty'
  require 'json'

  class Tag < Client

    attr_accessor :name, :domain
    
    def initialize(name, domain)
      self.name = name
      self.domain = domain
    end
    
    def info
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{@@api_key}&method=#{method}&format=#{@@format}&domain=#{self.domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      tag_info = [{ tag: self.name }]
      keyword_list = []
      parsed_response.each do |keywords|
        tag_list = keywords['tags'].to_a
        if tag_list.include? self.name
          keyword_list << keywords['keyword']
        end
      end
      tag_info << { keywords: keyword_list }
      return tag_info
    end
    
    def keywords
      method = "keywords_tags"
      raven_url = "#{RavenTools::API_BASE_URL}key=#{@@api_key}&method=#{method}&format=#{@@format}&domain=#{self.domain}"
      response = HTTParty.get(raven_url)
      parsed_response = JSON.parse(response.body)
      keyword_list = []
      parsed_response.each do |keywords|
        tag_list = keywords['tags'].to_a
        if tag_list.include? self.name
          keyword_list << keywords['keyword']
        end
      end
      return keyword_list
    end
    
    def api_key
      @@api_key
    end
    
  
  end 

end