# Arranging Coins

# You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.
# Given n, find the total number of full staircase rows that can be formed.
# n is a non-negative integer and fits within the range of a 32-bit signed integer.

# Example

# n = 5
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤
# Because the 3rd row is incomplete, we return 2.

# n = 8
# The coins can form the following rows:
# ¤
# ¤ ¤
# ¤ ¤ ¤
# ¤ ¤
# Because the 4th row is incomplete, we return 3.

# Time Complexity = O(n)
# Space Complexity = O(1)
def arrange_coins(n)
	return -1 if n < 0  # Return -1 for negative numbers.
    curr = n
    sum = 0
    i = 1  # Initalize variable to represent each step.
    while true do
        j = 1  # Initialize j to 1 to store elements at each step.
        # Traverse while j is less than equal to i.
        while j <= i do
            sum = sum + 1  # Add 1 to sum for each element to keep track of total sum
            puts "sum = #{sum}, j = #{j}, i = #{i}"
            # Check if sum is greater than equal to n.
            # If j equals i, means last step is completely filled, then return i otherwise return i-1.
            if sum >= n
                res = j == i ? i : i-1
                return res
            end
            j = j+1  # Increment j for no of elements at each step.
        end
        i = i+1  # Increment i for next step when one step is filled.
    end
end

puts arrange_coins(5)
puts arrange_coins(8)
