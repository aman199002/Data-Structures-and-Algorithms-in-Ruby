def search(n,arr,l,h)
	return false if l > h
	x = (h+l)/2
	if n == arr[x]
		puts "equal"
		return x
	elsif n < arr[x]
		puts "lower"
		search(n,arr,0,x-1)
	elsif n > arr[x]
		puts "greater"
		search(n,arr,x+1,h)
	end
end

print search(19,[0,2,3,4,7,8],0,5)