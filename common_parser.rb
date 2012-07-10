require 'rubygems'
require 'nokogiri'
require 'open-uri'

class CommonParser
  def self.common_meth(web_url,tag)
    noko_obj = Nokogiri::HTML(open(web_url){ |f| f.read})
    obj = noko_obj.css("meta")
    obj.each do |content|
        status = (content['property'].to_s == tag)
        if status
          return content['content']
        end
    end

  end
end
