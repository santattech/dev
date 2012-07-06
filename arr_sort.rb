arr = [10,1,2,20,4,15,11,14]
b = []
len = arr.length
while b.length < len
	arr.each_with_index do |a,i|
		if i < arr.length - 1
			if arr[i] > arr[i+1]
				temp = arr[i+1]
				arr[i+1] = arr[i]
				arr[i] = temp
			end
		end
	end
	b<<arr.pop
end

b.reverse.each do |b|
	puts b
end

