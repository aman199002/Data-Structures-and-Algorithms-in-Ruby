# Reverse a string in place without using extra space
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse(s)
	return if s.empty?
	k = s.size - 1
	for i in 0..(s.size-1)/2 do
		s[i],s[k] = s[k],s[i]
		k = k-1
	end
	s
end

print reverse('hello')