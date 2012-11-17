module RavenTools
  
  require 'uri'
  require 'net/https'
  require 'open-uri'
  require 'json'
  
  class Client

    attr_accessor :api_key
    
    def initialize(api_key)
      self.api_key = api_key
    end
  
    def show_key
      puts self.api_key
    end
    
    def get_domains(format)
      if format == "json" || format == "xml"
        method = "domains"
        api_params = "/api?key=#{self.api_key}&format=#{format}&method=#{method}"
        raven_uri = URI.parse(RavenTools::API_BASE_URL)
        raven_http = Net::HTTP.new(raven_uri.host, raven_uri.port)
        raven_http.use_ssl = true
        raven_http.start { |http|
          body = http.get(api_params).body
          parsed_body = JSON.parse(body)
          parsed_body.each do |domain|
            puts domain
          end
        }
      else
        puts "Format needs to be either 'json' or 'xml'."
      end
    end
  
  end
end