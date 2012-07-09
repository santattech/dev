require 'rubygems'
require 'nokogiri'
##############  HTML Builder  (with ruby code we are creating a html file)

builder = Nokogiri::HTML::Builder.new do |doc|
  doc.html{
    doc.h1{
      doc.text "Hello Santanu"
    }
    doc.body{

        doc.font(:color => "red"){
          doc.strong{
            doc.text "You are Red."
          }
        }

    }
  }
end

aFile = File.new("abc.html", "w+")
if aFile
  aFile.syswrite(builder.to_html)
else
  puts "Unable to open the file"
end

