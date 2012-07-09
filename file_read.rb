require 'rubygems'
require 'open-uri'
require 'nokogiri'
class HtmlParse

  def title(obj)
    title_text = obj.match(/<title>(.*)<\/title>/m)[1].strip
  end

  def tag_method file,tag
    div_final_arr = []
    file.each_line do |f|
      _div_hash = { }
      div_final_hash = { }
       x = f.match(/<#{tag}(.*)">(.*)<\/#{tag}>/)
       if x != nil
         div_attr_arr = x[1].split(" ")
         div_attr_arr.each do |da|
             _div_hash[da.split('=')[0]] = da.split('=')[1].to_s
         end


         div_final_hash["text"] = x[2]
         div_final_hash["attr"] = _div_hash
         div_final_arr << div_final_hash
       end


    end

    return div_final_arr

  end

end

page = File.open('index.html') { |f| f.read }
web_page = open("http://www.google.co.in"){|f| f.read }
html = HtmlParse.new
valid_tag = []
puts "the title is : "+html.title(page).to_s
puts "the title of the web page is : "+html.title(web_page).to_s

final_arr = html.tag_method(page,'li')
final_arr.each do |a|
  puts "#{a['text']}======>with:"
  a["attr"].each do |key,value|
    puts "#{key}------> #{value}"
  end
end
=begin
html.div(page)['attr'].each do |key,value|
# puts "#{key}------------------------->#{value}"

end
=end


