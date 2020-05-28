# Counting Bits
# Solution
# Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.

# Example:

# Input: 2
# Output: [0,1,1]

# Input: 5
# Output: [0,1,1,2,1,2]


# Time Complexity = O(n)
# Space Complexity = O(n)
def count_bits(num)
	return [0] if num == 0
	return [0,1] if num == 1
	res = [0,1]  # Initialize array and store values for 0th and 1st element.
	for i in 2..num do
		div = i/2
		div_val = res[div]  # Divide element by 2 and get its value from previous elements stored in array.
		rem = i%2
		rem_val = res[rem]  # Get reminder by dividing element by 2 and get its value from previous elements stored in array.
		res << (div_val + rem_val)  # Add divisor and reminder values and insert in array.
	end
	return(res)
end

print count_bits(2)
print count_bits(5)
