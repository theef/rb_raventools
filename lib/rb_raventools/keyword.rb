module RavenTools

  require 'httparty'
  require 'json'

  class Keyword < Client

    attr_accessor :name
    
    def initialize(name, domain)
      self.name = name
      self.domain = domain
    end
    
    def tags
      
    end
    
    def api_key
      @@api_key
    end
    
  end
  
end