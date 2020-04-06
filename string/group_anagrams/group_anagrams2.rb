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

# Time Complexity = O(NK)
# Space Complexity = O(NK)
def group_anagrams(a)
	h1 = {}
	for i in 0..a.size-1 do
		count = [0]*26
		for j in 0..a[i].size-1 do
			count[(a[i][j].ord - 'a'.ord)] = count[a[i][j].ord - 'a'.ord]+1
		end
		if h1[count]
			h1[count] = (h1[count] << a[i])
		else
			h1[count] = [a[i]]
		end	
	end
	h1.values
end

print group_anagrams(['eat','tea','tan','ate','nat','bat'])