# Maximum Distance in Arrays

# Given m arrays, and each array is sorted in ascending order. Now you can pick up two integers from two different arrays (each array picks one) and calculate the distance. We define the distance between two integers a and b to be their absolute difference |a-b|. Your task is to find the maximum distance.

# Example:

# Input: 
#  [[1,2,3],
#  [4,5],
#  [1,2,3]]
# Output: 4

# Explanation: 
# One way to reach the maximum distance 4 is to pick 1 in the first or third array and pick 5 in the second

# @param {Integer[][]} arrays
# @return {Integer}
# Time Complexity = O(n)
# Space Complexity = O(1)
def max_distance(arrays)
    return 0 if arrays == nil || arrays.size == 0
    res = 0
    min = arrays[0][0]
    max = arrays[0][-1]
    for i in 1..arrays.size-1 do
    	res = [ res,(arrays[i][-1] - min).abs, (max - arrays[i][0]).abs ].max
    	min = [min,arrays[i][0]].min
    	max = [max,arrays[i][-1]].max
    end	    
    return res
end


a = [[1,2,3],
	 [4,5],
	 [1,2,3]]

puts max_distance(a)
puts max_distance([[1,5],[3,4]])
