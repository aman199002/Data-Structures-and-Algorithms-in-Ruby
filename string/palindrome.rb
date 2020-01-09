# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
# Note: For the purpose of this problem, we define empty string as valid palindrome.
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
    s = s.downcase
	i = 0
	j = s.size-1
	while i < j do
		while (i<j && !((s[i] >= '0' &&  s[i] <= '9') || (s[i].ord >= 97 &&  s[i].ord <= 122))) do
			i = i+1
		end
		while (i<j && !((s[j] >= '0' &&  s[j] <= '9') || (s[j].ord >= 97 &&  s[j].ord <= 122))) do
			j = j-1
		end
		if s[i] != s[j]
			return false
		end	
		i = i+1
		j = j-1
	end
	true
end

puts is_palindrome('madam')
puts is_palindrome("A man, a plan, a canal: Panama")
puts is_palindrome('.,')
puts is_palindrome('0P')
puts is_palindrome('')