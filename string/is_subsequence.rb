# Is Subsequence

# Given a string s and a string t, check if s is subsequence of t.
# A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

# Follow up:
# If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?

# Example:

# Input: s = "abc", t = "ahbgdc"
# Output: true

# Input: s = "axc", t = "ahbgdc"
# Output: false

# @param {String} s
# @param {String} t
# @return {Boolean}
# Time Complexity = O(n)
# Space Complexity = O(1)
def is_subsequence(s, t)
    i = 0
    j = 0
    # Traverse till i less than string s and j less than t.
    while i < s.size && j < t.size do
    	# Increment i if char at i equals char at j.
    	if s[i] == t[j]
    		i = i+1
    	end
    	j = j+1  # Increment j
    end
    # When i is equal to string s size, means all chars have been traversed and found in sequence, return true. Else false.
    return(i == s.size)
end

puts is_subsequence('abc', 'ahbgdc')
puts is_subsequence('acb', 'ahbgdc')
puts is_subsequence('a', '')
