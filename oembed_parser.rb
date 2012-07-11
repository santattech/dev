require 'rubygems'
require 'nokogiri'
require 'open-uri'
class UrlNotFound < StandardError
end
module Oembed

  class OembedParser

    def initialize(api_end_point_url,schema_url)
      @api_end_point_url = api_end_point_url
      @schema_url = schema_url
    end

    def parse_response_xml
      noko_obj = Nokogiri::XML(open("#{@api_end_point_url}?url=#{@schema_url}"))
    end

    def get_value(tag)
      begin
        obj = parse_response_xml
        value_arr = []
        obj.css(tag).each do |o|
          value_arr << o.text
        end
        return value_arr
      rescue OpenURI::HTTPError => boom
        return "Error : "+boom.to_s
      end
    end

  end
end
