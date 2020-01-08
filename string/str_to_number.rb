def convert(str)
	str = str.strip # If initial space need to be trimmed.
	result = 0
	multiplier = str[0] == '-'? -1 : 1
	for i in 0..str.length-1
		if i == 0 && (str[i] == '+' || str[i] == '-')
			# do nothing
			next
		elsif str[i] >= '0' && str[i] <= '9'
			# Convert one character string to number by subtracting ordinal of '0'. Add the number to result after multiplying by 10.
			result = result * 10 + (str[i].ord - '0'.ord)
		else
		  return result * multiplier
		end
	end	
	result = result * multiplier
end

str = "-56467 4675647"
print convert(str)


