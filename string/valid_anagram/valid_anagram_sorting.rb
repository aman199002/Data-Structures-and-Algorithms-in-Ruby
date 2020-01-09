# Given two strings s and t , write a function to determine if t is an anagram of s.
# Complexity: O(logn)
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s,t)
	s.chars.sort == t.chars.sort
end

puts is_anagram('anagram','nagaram')
puts is_anagram('rat','car')