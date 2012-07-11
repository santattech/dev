require 'rubygems'
require 'nokogiri'
require 'open-uri'
module MetaParser

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
