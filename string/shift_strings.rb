#You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:
# direction can be 0 (for left shift) or 1 (for right shift). 
# amount is the amount by which string s is to be shifted.
# A left shift by 1 means remove the first character of s and append it to the end.
# Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
# Return the final string after all operations.

# Example:

# Input: s = "abc", shift = [[0,1],[1,2]], Output: "cab"

# Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]] Output: "efgabcd"
# Explanation:  
# [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
# [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
# [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
# [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"

def string_shift(s, shift)
	return s if s.empty?
	n = s.size
	# Initialize left_shift variable equal to 0
	left_shift = 0  
    # We know that left shift cancels right shift.
    # So, we will keep on adding left_shift for value 0
    # and subtracting from left_shift when its equal to 1
    for i in 0..shift.size-1 do
    	if shift[i][0] == 0
    		left_shift = left_shift + shift[i][1]
    	elsif shift[i][0] == 1
    		left_shift = left_shift - shift[i][1]
    	end	
    end
    # If value of left shift is greater than string size, then we can find modulus and shift string with that
    # as there is no use of rotating of same string multiple times because result will be same.
    left_shift = left_shift%n
    if left_shift != 0
    	s = s[left_shift..n-1] + s[0..left_shift-1]
    end
    s
end

puts string_shift('abc',[[0,1],[1,2]])
puts string_shift('abcdefg',[[1,1],[1,1],[0,2],[1,3]])
puts string_shift("yisxjwry",[[1,8],[1,4],[1,3],[1,6],[0,6],[1,4],[0,2],[0,1]])