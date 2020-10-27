# @param {String} s
# @param {Integer} k
# @return {Integer}
# Time Complexity = O(n)
# Space Complexity = O(k)
def length_of_longest_substring_k_distinct(s, k)
	return 0 if s == ''
    i = 0
    j = 0
    h1 = {}
    dist = 0
    max = 0
    while j < s.size do
    	while dist <= k && j < s.size do
	    	if h1[s[j]]
	    		h1[s[j]] = h1[s[j]]+1
	    	else
	    		h1[s[j]] = 1
	    		dist = dist+1
	    	end
	    	j = j+1
	    	break if dist > k
	    	max = [max,(j-i)].max
	    end	
	    if h1[s[i]] > 1
	    	h1[s[i]] = h1[s[i]]-1
	    else
	    	h1.delete(s[i])
	    	dist = dist-1 
	    end	
	    i = i+1
    end	
    return max
end


puts length_of_longest_substring_k_distinct('eceba', 2)
puts length_of_longest_substring_k_distinct('ecebaaaaa', 2)
puts length_of_longest_substring_k_distinct('', 2)
puts length_of_longest_substring_k_distinct('aaaaa', 2)
puts length_of_longest_substring_k_distinct("ababffzzeee", 2)