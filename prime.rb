puts "Printing the prime numbers from 0 to 100"
prime_arr = [2]
(3..100).each do |num|
  flag = 0
  (2..num-1).each do |d|
    if num % d == 0
      flag = 1
    end
  end
  if flag == 0
    prime_arr << num
  end

end
#puts "The prime number 1 : 2"
prime_arr.each_with_index do |prime,index|
  puts "The prime number #{index+1} : #{prime}"
end
