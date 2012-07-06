arr = [12,45,67,45,34,76]
i=1
arr.each do |a|
	puts "Element no #{i} is-------->"+a.to_s
	i = i + 1
end

arr.each_with_index do |a,j|
	puts "Element no #{j} is-------->"+a.to_s
end

puts "total no of elements in the array : #{arr.length}"
