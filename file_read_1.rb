require 'rubygems'
require 'open-uri'
require 'nokogiri'
class HtmlParse

  def title(obj)
    title_text = obj.match(/<title>(.*)<\/title>/m)[1].strip
  end

  def download
    p "Enter a URL you want to parse : "
    url = gets
    url_obj = open("#{url}"){ |f| f.read}
  end

  def title_bod
    p "Enter the tag you want to see : "
    tag_val = gets

       title download

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

html = HtmlParse.new
p html.search_tag_with_id.text


=begin

div_obj_2 = noko_obj.css('div#gbw')
puts "The text of the div is : "+div_obj_2.text

div_obj_2.each do |key,value|
  puts "#{key} with the value : "+value.to_s
end


puts "It is returning a lot.."

puts "We want to take the li only.."
div_obj_3 = noko_obj.css('div#gbw li')

puts "The number of li s are : "+div_obj_3.length.to_s
puts "The text of li s are : "+div_obj_3[0].text

=end
