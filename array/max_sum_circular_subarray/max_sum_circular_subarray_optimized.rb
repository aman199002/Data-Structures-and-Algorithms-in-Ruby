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

# Time Complexity = O(n)
# Space Complexity = O(n)
def max_subarray_sum_circular(a)
    arr_size = a.size
	sum = 0
    # Find simple sum of array.
    for i in 0..arr_size-1 do
        sum = sum + a[i]
    end
    # Get max sum of contiguous subarray.
    curr_max = a[0]
    max_sum = a[0]
    for i in 1..arr_size-1 do
        curr_max = [(curr_max+a[i]),a[i]].max
        max_sum = [curr_max,max_sum].max
    end
    # Invert all array elements by multiplying with -1.
    inverted_arr = []
    for i in 0..arr_size-1 do
        inverted_arr[i] = a[i] * -1
    end
    # Find max sum of contiguous subarray from this inverted array.
    # Here, we will be able to find sum of minimum subarray.
    # (Sum - minimum subarray sum) will be the max sum for contiguous elements in circular array.
    max_sum_inverted = inverted_arr[0]
    curr_max_inverted = inverted_arr[0]
    for i in 1..arr_size-1 do
        curr_max_inverted = [(inverted_arr[i] + curr_max_inverted),inverted_arr[i]].max
        max_sum_inverted = [max_sum_inverted,curr_max_inverted].max
    end
    # puts "max_sum = #{max_sum}, max_sum_inverted = #{max_sum_inverted}".
    # Find circular sum by adding sum with max sum from inverted subarray.
    # To find circular sum, we should subtract minimum subarray sum from sum.
    # As we have inverted all elements before, so we will invert minimum subarray sum also.
    circular_sum = sum - (max_sum_inverted * -1)
    # Here comparing if circular_sum is less than max_sum, then we should return max_sum.
    # If there are equal positive and negative numbers, so we should not return 0, hence we will return max_sum.
    if circular_sum > max_sum && circular_sum != 0
        return circular_sum
    else
        return max_sum
    end
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

