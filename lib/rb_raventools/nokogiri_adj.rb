class Nokogiri::XML::Node
  
  def domains_to_hash(selector = 'body > *')
    
    hash = []
    self.xpath('//Raven/domains/domain').each do |node|
      puts node.content
      hash << node.content
    end
    return hash
    
  end
  
end