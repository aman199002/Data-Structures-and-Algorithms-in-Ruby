def bits_required(n)
	return 0 if n <= 0
	i = 0
	while n > 0
		n = n/2
		i = i+1
	end
	i
end

number = 32
print bits_required(number)