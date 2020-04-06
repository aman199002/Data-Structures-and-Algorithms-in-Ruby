# Group Anagrams
# Given an array of strings, group anagrams together.

# Example
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Output:
# [
#   ["ate","eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]

# Time Complexity = O(NK logk)
# Space Complexity = O(NK)
def group_anagrams(a)
	h1 = {}
	for i in 0..a.size-1 do
		sorted_str = a[i].chars.sort
		if h1[sorted_str]
			h1[sorted_str] = (h1[sorted_str] << a[i])
		else
			h1[sorted_str] = [a[i]]
		end	
	end
	h1.values
end

print group_anagrams(['eat','tea','tan','ate','nat','bat'])