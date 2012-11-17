module RavenTools
  class Client

    attr_accessor :api_key
    
    def initialize(api_key)
      self.api_key = api_key
    end
  
    def show_key
      puts self.api_key
    end
  
  end
end