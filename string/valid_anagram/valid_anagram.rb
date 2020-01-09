# Given two strings s and t , write a function to determine if t is an anagram of s.
# Complexity: O(n)
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s,t)
	h1,h2 = {},{}
	for i in 0..s.size-1 do
		if h1[s[i]]
			h1[s[i]] = h1[s[i]] + 1
		else
			h1[s[i]] = 1	
		end	
	end
	for i in 0..t.size-1 do
		if h2[t[i]]
			h2[t[i]] = h2[t[i]] + 1
		else
			h2[t[i]] = 1
		end	
	end
	h1 == h2
end

puts is_anagram('anagram','nagaram')
puts is_anagram('rat','car')