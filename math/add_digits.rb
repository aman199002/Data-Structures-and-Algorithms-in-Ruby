# Add Digits
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

# Example:
# Input: 38
# Output: 2 
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

# @param {Integer} num
# @return {Integer}
def add_digits(num)
	# Traverse till number is greater than equal to 10.
    while num >= 10 do
    	sum = 0  # Initialize sum equal to 0.
    	# Find sum of given number by adding each digit to sum.
    	while num > 0 do
	        rem = num%10
	        num = num/10
	        sum = sum + rem
	    end
	    num = sum  # Assign sum variable to num
    end
    return num  # Return num when number is less than 10.
end

puts add_digits(38)
puts add_digits(183)

