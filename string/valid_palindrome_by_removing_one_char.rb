# Valid Palindrome II

# Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

# Example:

# Input: "aba"
# Output: True

# Input: "abca"
# Output: True
# Explanation: You could delete the character 'c'.

def valid_palindrome(s)
	return true if s == nil || s == ''
	# return true if is_palindrome(s)
	n = s.size
    i = 0
    j = n-1
    while i < j do
    	if s[i] != s[j]
    		sub1 = (i == 0 ? '' : s[0..i-1]) + s[i+1..n-1]
    		sub2 = s[0..j-1] + s[j+1..n-1]
    		return is_palindrome(sub1) || is_palindrome(sub2)
    	end
    	i = i+1
    	j = j-1
    end	
    return true
end

private

def is_palindrome(str)
	return true if str == ''
	start = 0
	last = str.size-1
	while start <= last do
		if str[start] != str[last]
			return false
		end	
		start = start+1
		last = last-1
	end	
	return true
end

puts valid_palindrome('aba')
puts valid_palindrome('ddabcadd')
puts valid_palindrome('cbbcc')
puts valid_palindrome('cabba')
puts valid_palindrome('abbac')
puts valid_palindrome('bbaaa')
