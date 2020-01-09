# The count-and-say sequence is the sequence of integers with the first five terms as following:
# 1.     1
# 2.     11
# 3.     21
# 4.     1211
# 5.     111221
# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211

# Example
# Input: 1
# Output: "1"
# Explanation: This is the base case.

# Input: 4
# Output: "1211"

# @param {Integer} n
# @return {String}
def count_and_say(n)
	if n == 1
		return '1'
	end	
	res = count_and_say(n-1)
	i = 0
	count = 1
	out = ''
	while i <= res.length-1 do
		num = res[i]
		if res[i] == res[i+1]
			count = count+1
		else
			out << (count.to_s + res[i])
			count = 1
		end
		i = i+1
	end
	out	
end

puts count_and_say(1)
puts count_and_say(5)
puts count_and_say(8)
puts count_and_say(11)