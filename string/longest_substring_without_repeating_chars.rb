# Longest Substring Without Repeating Characters
# Given a string, find the length of the longest substring without repeating characters.

# Example:

# Input: "abcabcbb"
# Output: 3 
# Explanation: The answer is "abc", with the length of 3. 

# Example:
# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example:
# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.

def length_of_longest_substring(s)
	n = s.size
	max,i,j = 0,0,0
	h1 = {}  # Initialize a hash to store substring chars.
	while i < n && j < n do
		# puts "i=#{i}, j=#{j}, h1=#{h1}"
		if h1[s[j]]
			# Delete character from hash if its already there and increment i
			h1.delete(s[i])
			i = i+1
		else			
			h1[s[j]] = 1 # Insert character into hash
			j = j+1  # Increment j
		end
		len = j-i  # Calculate length by subtracting i from j.
		max = [len,max].max  # Get max length by comparing with max variable.
	end
	return max  # Return max
end

puts length_of_longest_substring("abcabcbb")
puts length_of_longest_substring("pwwkewde")
puts length_of_longest_substring("pwpkewde")
puts length_of_longest_substring("abba")
