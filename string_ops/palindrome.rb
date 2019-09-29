def is_palindrome(str)
	i = 0
	j = str.length - 1
	while i < j
		return false if str[i] != str[j]
		i = i+1
		j = j-1
	end
	true
end

str = 'abcdcba'
print is_palindrome(str)