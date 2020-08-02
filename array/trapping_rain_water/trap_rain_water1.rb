# Trapping Rain Water
# Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

# The elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

# Example:
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6

# @param {Integer[]} height
# @return {Integer}
# Time Complecity = O(n^2)
# Space Complecity = O(1)
def trap(a)
	res = 0
	n = a.size
	for i in 1..n-1 do
		# Initialize left max and right max with current height
		lmax, rmax = a[i],a[i]
		# For every element, find left max
		for j in 0..i-1 do
			lmax = [lmax,a[j]].max
		end
		# For every element, find right max
		for j in (i+1)..n-1 do
			rmax = [rmax,a[j]].max
		end
		# Find water by getting minimum of left max and right max and subtract height of current element.
		water = [lmax,rmax].min - a[i]
		# puts "lmax = #{lmax}, rmax = #{rmax}, water = #{water}"
		# Add water to result
		res = res + water
	end
	return res
end

puts trap([0,1,0,2,1,0,1,3,2,1,2,1])
