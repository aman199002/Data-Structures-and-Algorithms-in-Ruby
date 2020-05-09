# Given a positive integer num, write a function which returns True if num is a perfect square else False.
# Note: Do not use any built-in library function such as sqrt.

# Example:

# Input: 16
# Output: true

# Input: 14
# Output: false

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
	return true if num==1
    i = 1
    square = 1
    while square < num do
    	square = i*i
    	if square == num
    		return true
    	end	
    	i = i+1
    end
    return false
end

puts is_perfect_square(1)
puts is_perfect_square(25)
puts is_perfect_square(625)
puts is_perfect_square(1000)