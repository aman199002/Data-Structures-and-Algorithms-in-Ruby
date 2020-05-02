# Jewels and Stones
# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  
# You want to know how many of the stones you have are also jewels.
# The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".

# Example:

# Input: J = "aA", S = "aAAbbbb"
# Output: 3

# Input: J = "z", S = "ZZ"
# Output: 0

# Time Complexity = O(n)
# Space Complexity = O(n)
def num_jewels_in_stones(j, s)
	return 0 if j == '' || s == ''
	h1 = {}  # Initialize empty hash
	for i in 0..j.size-1 do
		h1[j[i]] = 0   # Store each character of string j in hash with value 0.
	end
	# Iterate each character of string s
	for k in 0..s.size-1 do
		# If chracter at current index exist in hash, then increment value of that key
		if h1[s[k]]
			h1[s[k]] = h1[s[k]] + 1
		end
	end
	return h1.values.sum  # Get sum of all keys from hash and return.
end


puts num_jewels_in_stones('aA', 'aAAbbbb')
puts num_jewels_in_stones('z', 'ZZ')