# Sort Characters By Frequency
# Given a string, sort it in decreasing order based on the frequency of characters.

# Examples:

# Input: "tree"
# Output: "eert"

# Input: "cccaaa"
# Output: "cccaaa"

# Input: "Aabb"
# Output: "bbAa"

# @param {String} s
# @return {String}
# Time Complexity = O(nlogn)
# Space Complexity = O(n)
def frequency_sort(s)
	return '' if s == ''
	h1 = {}
	res = ''
    for i in 0..s.size-1 do
    	if h1[s[i]]
    		h1[s[i]] = h1[s[i]] + 1
    	else
    		h1[s[i]] = 1	
    	end	
    end
    h1 = h1.sort_by{|k,v| -v}
    h1.each do |k,v|
    	v.times{res << k}
    end
    res
end

puts frequency_sort('tree')
puts frequency_sort('cccaaa')
puts frequency_sort('Aabb')
puts frequency_sort('')
