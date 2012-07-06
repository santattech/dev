require 'open-uri'

puts "The first exception problems"
page = "podcasts"
file_name = "#{page}.html"
web_page = open("http://pragprog.com/#{page}")
output = File.open("#{page}.html", "w")
begin
  while line = web_page.gets
    output.puts line
  end
  output.close

rescue Exception
  STDERR.puts "Failed to download #{page}.html : #{$!}"
  output.close
  File.delete(file_name)
  raise
end

