puts "checking the zero division exception"
num = 100
#class ZeroValueError < StandardError;end
begin
 arr = [10,2,4,5,0,12]
 arr.each do |a|
    #raise ZeroValueError if a.zero?
    puts "the result is : ---->>"+(num / a).to_s
 end

rescue SyntaxError, NameError => boom
  print "String does not compile: "+boom
#rescue StandardError => bang
 # print "Error running script"+bang
rescue ZeroDivisionError => bong
  print "Can not be divided by zero : "+bong
else
  print "congratulations no error "
ensure
  puts " "
  puts "Its a arbitrary prog. if there remain some error plz ignore and try later."
end


