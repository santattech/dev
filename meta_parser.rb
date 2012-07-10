require 'common_parser.rb'
module MetaParser

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
