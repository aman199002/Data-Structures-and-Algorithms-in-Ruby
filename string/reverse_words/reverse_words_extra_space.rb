# Reverse Words in a String
# Given an input string, reverse the string word by word.

# Example:

# Input: "the sky is blue"
# Output: "blue is sky the"

# Input: "  hello world!  "
# Output: "world! hello"
# Explanation: Your reversed string should not contain leading or trailing spaces.

# Input: "a good   example"
# Output: "example good a"
# Explanation: You need to reduce multiple spaces between two words to a single space in the reversed strin

# @param {String} s
# @return {String}
# Time Complexity = O(n)
# Space Complexity = O(n)
def reverse_words(s)
    i = 0
    a = []
    size  = s.size
    # Traverse while i is less than size of the string.
    while i < size do
    	sub = ''  # Initiate a substring with length 0.
    	# Traverse until a space is appeared.
    	while s[i] != ' ' && i < s.size do
    		sub << s[i]
    		i = i+1
    	end
    	# Insert substring to array if its not nil.
    	a << sub if sub != ''
    	# Increment i for every space character
    	i = i+1
    end
    i = a.size - 1  # Initiate i with array size.
    res = ''  # Take res string variable to store the output string.
    # Traverse in reverse order and store all elements in res string.
    while i >= 0 do
    	res << a[i]
    	res << ' ' if i != 0
    	i = i-1
    end
    return res  # Return res
end

puts reverse_words("the sky is blue")
puts reverse_words("  hello world!  ")
puts reverse_words("a good   example")
puts reverse_words("")
