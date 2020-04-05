# A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
# Write a function to determine if a number is strobogrammatic. The number is represented as a string.
# For example, the numbers "69", "88", and "818" are all strobogrammatic.

# Time Complext = O(n)
def is_strobogrammtic?(s)
	i = 0 
	j = s.size-1
	while i <= j do 
		if !((s[i] == '6' && s[j] == '9') || (s[i] == '9' && s[j] == '6') || (s[i] == '0' && s[j] == '0') || (s[i] == '1' && s[j] == '1') || (s[i] == '8' && s[j] == '8'))
			return false
		end
		i = i+1
		j = j-1
	end
	return true
end

puts is_strobogrammtic?("69")
puts is_strobogrammtic?("66")
puts is_strobogrammtic?("88")
puts is_strobogrammtic?("818")