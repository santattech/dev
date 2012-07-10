require 'rubygems'
require 'open-uri'
require 'nokogiri'
class HtmlParse

  def title_tag(obj,tag_val)   # self define title method
    title_text = obj.match(/<#{tag_val}>(.*)<\/#{tag_val}>/m)[1].strip
  end

  def download
    p "Enter a URL you want to parse : "
    url = gets
    url_obj = open("#{url}"){ |f| f.read}
  end

  def title_bod
    obj = download
    puts "Enter the tag you want to see : "
    tag_val = gets
    title_tag obj,tag_val.strip

  end

  def tag_attributes
    noko_obj = Nokogiri::HTML(download)
    p "Enter the tag you want to see : "
    tag_val = gets
    div_obj = noko_obj.css(tag_val.strip)
  end

  def attributes_list
    obj = tag_attributes
    p "Enter the attribute you want to see : "
    attr_val = gets
    obj.each do |val|
      p val[attr_val.strip]
    end
  end

  def search_tag_with_id
    noko_obj = Nokogiri::HTML(download)
    p "Enter the tag :"
    tag_val = gets
    puts "Enter the id :"
    id_val = gets
    noko_obj.css(tag_val.strip+"#"+id_val.strip)  ## it will return the obj
  end

end

begin
  html = HtmlParse.new
  #p html.search_tag_with_id.text
  #p html.title_bod
  html.attributes_list
rescue NoMethodError
  retry
end
