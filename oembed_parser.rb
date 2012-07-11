require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

module Oembed

  class HtmlParser
    def initialize(url)
      @url = url
    end

    def parse_html
      noko_obj = Nokogiri::HTML(open(@url))
    end

    def parser_type_availability
      begin
        option_arr = []
        parse_html.css("link").each do |no|
          if no["type"].to_s.scan("/xml").length > 0
            option_arr << no["type"]
          elsif no["type"].to_s.scan("/json").length > 0
            option_arr << no["type"]
          end
        end
        option_arr
      rescue OpenURI::HTTPError => boom
        return "Error : "+boom.to_s
      end
    end
  end

  class OembedParserJson
    def initialize(api_end_point_url,schema_url)
      @api_end_point_url = api_end_point_url
      @schema_url = schema_url
    end

    def parse_response_json
      open("#{@api_end_point_url}?url=#{@schema_url}"){ |f| f.read}
    end

    def page_to_json
      begin
        obj = parse_response_json
        return  JSON.parse(obj)
      rescue OpenURI::HTTPError => boom
        return "Error : "+boom.to_s
      end
    end

    def get_value(tag)
      json_obj = { }
      key_arr = []
      json_obj = page_to_json if page_to_json != "Error : 404 Not Found"
      json_obj.each do |key,value|
        key_arr << key
      end
      return key_arr.include?(tag) ? json_obj[tag]: "#{tag} Not found"
    end

  end


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
