module RavenTools

  require 'httparty'
  require 'json'

  class Domain < Client

    attr_accessor :name
    
    def initialize(name)
      self.name = name
    end
    
    def keywords
      
    end
    
    def tags
      
    end
    
    def api_key
      @@api_key
    end
    
  end
  
end