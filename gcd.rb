puts "Evaluate the GCD of two numbers"
flag = 0
print "Enter the first number : "
num1 = gets

puts " "
print "Enter the second number : "
num2 = gets

puts " "

while 1 do
begin
  #raise "Incorrect inputs. Enter valid numbers only" if num1.is_a?String
  #raise "Incorrect inputs. Enter valid numbers only" if num2.is_a?String
  if num1.to_i > num2.to_i
    c = num1.to_i % num2.to_i
  else
     c = num2.to_i % num1.to_i
  end
rescue ZeroDivisionError => boom
  print "There may be an attempt to divide with zero."+boom
  puts "Enter the second number again."
  num2 = gets
  retry
end
  
  if c == 0
    puts "The GCD is : "+num2.to_s
    break
  end
  num1 = num2
  num2 = c
end
