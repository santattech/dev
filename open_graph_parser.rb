require 'rubygems'
require 'nokogiri'
require 'open-uri'

module OpenGraph
  class OpenGraphClass

    def initialize(url)
      @url = url
    end

    def parse_html
      noko_obj = Nokogiri::HTML(open(@url){ |f| f.read})
    end

    def key
      @noko_obj = parse_html
      key_arr = []
      @noko_obj.css("meta").each do |no|
        if no["property"] != nil
          property_obj = no["property"].to_s.match(/^og:(.+)$/i)
          if property_obj != nil && property_obj[1].split(':').length == 1
            key_arr << no["property"].to_s.match(/^og:(.+)$/i)[1]
          end
        end
      end
      return key_arr
    end

    def basic_meta_data
      @noko_obj = parse_html
      basic_meta_data_hash = { }
      @noko_obj.css("meta").each do |no|
          if no["property"] != nil
            property_obj = no["property"].to_s.match(/^og:(.+)$/i)
            if property_obj != nil && property_obj[1].split(':').length == 1
              basic_meta_data_hash[property_obj[1]] = no["content"]
            end
          end
      end
      basic_meta_data_hash
    end

    def basic_content(key_text)
      bmdh = basic_meta_data
      bmdh[key_text] if key.include?(key_text)
    end



  end
end
