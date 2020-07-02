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

# Time Complexity = O(logn)
# Space Complexity = O(1)
def arrange_coins(n)
	return -1 if n < 0  # Return -1 for negative number
    left = 0
    right = n
    # User binary search to find no of steps.
    while left <= right do
        mid = left + (right-left)/2
        # Assume that the answer is k, i.e. we've managed to complete k rows of coins.
        # Find the maximum k such that: k * (k+1)/2 <= N.
        curr = mid * (mid+1)/2
        if curr == n
            return mid
        elsif curr < n
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return right
end

puts arrange_coins(5)
puts arrange_coins(8)

