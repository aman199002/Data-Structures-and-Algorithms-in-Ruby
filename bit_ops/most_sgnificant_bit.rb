def find_msb(n)
	i = 0
	while n > 0
		n = n/2
		i = i+1
	end
	2**(i-1)
end

number = 65
print find_msb(number)