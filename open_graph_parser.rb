require 'rubygems'
require 'nokogiri'
require 'open-uri'

module OpenGraph

  class CommonParser

    def self.common_meth(web_url,tag)
      noko_obj = Nokogiri::HTML(open(web_url){ |f| f.read})
      #noko_obj = Nokogiri::HTML(File.open('rock.html'){ |f| f.read})
      content_arr = []
      obj = noko_obj.css("meta")
      obj.each do |content|
        status = (content['property'].to_s == tag)
        if status
          content_arr << content['content']
        end
      end
      return content_arr

    end
  end


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


  class Image
    def initialize(url)
      @url = url
    end

    def url
      CommonParser.common_meth(@url,"og:image")
    end

    def secure_url
      CommonParser.common_meth(@url,"og:image:secure_url")
    end

    def type
      CommonParser.common_meth(@url,"og:image:type")
    end

    def width
      CommonParser.common_meth(@url,"og:image:width")
    end

    def height
      CommonParser.common_meth(@url,"og:image:height")
    end

  end

  class Video
    def initialize(url)
      @url = url
    end

    def url
      CommonParser.common_meth(@url,"og:video")
    end

    def secure_url
      CommonParser.common_meth(@url,"og:video:secure_url")
    end

    def type
      CommonParser.common_meth(@url,"og:video:type")
    end

    def width
      CommonParser.common_meth(@url,"og:video:width")
    end

    def height
      CommonParser.common_meth(@url,"og:video:height")
    end

  end


  class Audio
    def initialize(url)
      @url = url
    end

    def url
      CommonParser.common_meth(@url,"og:audio")
    end

    def secure_url
      CommonParser.common_meth(@url,"og:audio:secure_url")
    end

    def type
      CommonParser.common_meth(@url,"og:audio:type")
    end
  end

end
