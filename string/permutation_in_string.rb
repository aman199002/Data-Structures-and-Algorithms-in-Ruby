# Permutation in String
# Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. 
# In other words, one of the first string's permutations is the substring of the second string.

# Example:

# Input: s1 = "ab" s2 = "eidbaooo", Output: True
# Explanation: s2 contains one permutation of s1 ("ba").

# Input:s1= "ab" s2 = "eidboaoo", Output: False

def check_inclusion(s1, s2)
	return false if s1 == '' || s2 == ''
	k = s1.size
	n = s2.size
    h1 = {}
    # Store all elements of string p in hash h1.
    for i in 0..k-1 do
    	if h1[s1[i]]
    		h1[s1[i]] = h1[s1[i]] + 1
    	else
    		h1[s1[i]] = 1
    	end
    end
    h2 = {}
    j = 0
    # Traverse each substring of length k.
    # Store elements of substring upto k length in hash h2.
    for i in 0..n-k do    	
    	while j < i+k do
    		if h2[s2[j]]
    			h2[s2[j]] = h2[s2[j]]+1
    		else
    			h2[s2[j]] = 1	
    		end
    		j = j+1
    	end
    	# Return true if h1 equals to h2
    	return true if h1 == h2
    	# After traversing, i will be i+1, so remove ith key from hash.
    	if h2[s2[i]] > 1
    		h2[s2[i]] = h2[s2[i]] - 1
    	else
    		h2.delete(s2[i])
    	end
    end
    # Return false if all elements are traversed i.e permutation not found in string.
    return false
end

puts check_inclusion('ab', 'eidbaooo')
puts check_inclusion('ab', 'eidboaoo')
