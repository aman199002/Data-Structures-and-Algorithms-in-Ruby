# Maximum Sum Circular Subarray

# Solution
# Given a circular array C of integers represented by A, find the maximum possible sum of a non-empty subarray of C.
# Here, a circular array means the end of the array connects to the beginning of the array.  (Formally, C[i] = A[i] when 0 <= i < A.length, and C[i+A.length] = C[i] when i >= 0.)
# Also, a subarray may only include each element of the fixed buffer A at most once.  (Formally, for a subarray C[i], C[i+1], ..., C[j], there does not exist i <= k1, k2 <= j with k1 % A.length = k2 % A.length.)

# Example 1:

# Input: [1,-2,3,-2], Output: 3
# Explanation: Subarray [3] has maximum sum 3

# Input: [5,-3,5], Output: 10
# Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10

# Input: [3,-1,2,-1], Output: 4
# Explanation: Subarray [2,-1,3] has maximum sum 2 + (-1) + 3 = 4

# Input: [3,-2,2,-3], Output: 3
# Explanation: Subarray [3] and [3,-2,2] both have maximum sum 3

# Input: [-2,-3,-1], Output: -1
# Explanation: Subarray [-1] has maximum sum -1

# Time Complexity = O(n^2)
# Space Complexity = O(1)
def max_subarray_sum_circular(a)
	return 0 if a.size == 0
    max_so_far = -2**32 # Initialize max_so_far with minimum number.
    # Nested loop to find max_sum for each possible array as given array is circular.
    for i in 0..a.size-1 do
    	curr_sum = a[i]
    	max_sum = a[i]
        # Taking modulus of index so that it does not exceed size of array.
    	j = (i+1)%(a.size)
    	while j != i do
    		curr_sum = [(curr_sum+a[j]),a[j]].max
    		max_sum = [curr_sum,max_sum].max
    		j = (j+1)%(a.size)  # Taking modulus
    	end
        # Comparing max_so_far with max_sum of each array and store maximum.
    	max_so_far = [max_so_far,max_sum].max
    end
    max_so_far
end

puts max_subarray_sum_circular([1,-2,3,-2])
puts max_subarray_sum_circular([-1,5,2,-3,-5])
puts max_subarray_sum_circular([5,-3,5])
puts max_subarray_sum_circular([5,3,5])
puts max_subarray_sum_circular([3,-1,2,-1])
puts max_subarray_sum_circular([3,-2,2,-3])
puts max_subarray_sum_circular([-2,-3,-1])
puts max_subarray_sum_circular([-5,3,5])
puts max_subarray_sum_circular([-2,4,4,4,6])
