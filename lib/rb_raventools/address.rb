module RavenTools
  class Address < Client
    
    def self.build(method, options = {})
      url = "#{RavenTools::API_BASE_URL}key=#{@@api_key}&format=#{@@format}&method=#{method}"
      unless options[:domain] == nil
        url << "&domain=#{options[:domain]}"
      end
      unless options[:start_date] == nil
        url << "&start_date=#{options[:start_date]}"
      end
      unless options[:end_date] == nil
        url << "&end_date=#{options[:end_date]}"
      end
      unless options[:engine] == nil
        url << "&engine=#{options[:engine]}"
      end
      return url
    end
    
  end
end