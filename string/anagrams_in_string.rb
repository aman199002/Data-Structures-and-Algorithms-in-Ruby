# Find all Anagrams in a String
# Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

# Example:

# Input: s: "cbaebabacd" p: "abc",  Output: [0, 6]
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".

# Input:# s: "abab" p: "ab",  Output: [0, 1, 2]
# Explanation:
# The substring with start index = 0 is "ab", which is an anagram of "ab".
# The substring with start index = 1 is "ba", which is an anagram of "ab".
# The substring with start index = 2 is "ab", which is an anagram of "ab".

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
	return [] if s == '' || p == ''
    h1 = {}  # Initialize empty hash.
    n = s.size
    k = p.size
    res = []
    # Store all elements of string p in hash h1.
    for i in 0..k-1 do
    	if h1[p[i]]
    		h1[p[i]] = h1[p[i]] + 1
    	else
    		h1[p[i]] = 1
    	end	
    end
    h2 = {}
    j = 0
    # Traverse each substring of length k.
    # Store elements of substring upto k length in hash h2.
    for i in 0..(n-k) do
    	while j < i+k do
    		if h2[s[j]]
    			h2[s[j]] = h2[s[j]] + 1
    		else
    			h2[s[j]] = 1
    		end
    		j = j+1
    	end
    	# Insert i into res array if h1 equals to h2
    	res << i if h1 == h2
    	# After traversing, i will be i+1, so remove ith key from hash.
    	if h2[s[i]] > 1
    		h2[s[i]] = h2[s[i]] - 1
    	else
    		h2.delete(s[i])
    	end
    end
    res  # Return result
end

print find_anagrams('cbaebabacd', 'abc')
print find_anagrams('abab', 'ab')
print find_anagrams('abab', 'cd')
