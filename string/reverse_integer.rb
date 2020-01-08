# Given a 32-bit signed integer, reverse digits of an integer.
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1].
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse(n)
	multiplier = n < 0 ? -1 : 1
	n = n.abs    
	res = 0
	while n > 0 do
		k = n%10
		n = n/10
		res = res*10 + k
	end
	res = res * multiplier
    res = (res >= 2**31 || res <= -2**31) ? 0 : res # Return 0 if number is out of range else result
end

puts reverse(123)
puts reverse(-123)
puts reverse(-120)