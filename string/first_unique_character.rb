# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
	h1 = {}
	for i in 0..s.size-1 do
		if h1[s[i]]
			h1[s[i]] = h1[s[i]] + 1
		else
			h1[s[i]] = 1
		end	
	end
	for i in 0..s.size-1 do
		if h1[s[i]] == 1
			return i
		end	
	end	
	return -1
end

puts first_uniq_char('leetcode')
puts first_uniq_char('loveleetcode')
puts first_uniq_char('maam')