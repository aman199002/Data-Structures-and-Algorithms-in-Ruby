# Trapping Rain Water
# Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

# The elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

# Example:
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6

# @param {Integer[]} height
# @return {Integer}
# Time Complecity = O(n)
# Space Complecity = O(n)

# Algorithm
# Iterate over each tower
# a. while stack is not empy and current > stack.top()
#      i. top = stack.pop()
#      ii. dist = current - stack.top() -1
#      iii height = min(current, stack.top()) - height[top]
#      iv. water+= dist * height
# b. push
# c. next tower
def trap(a)
	return 0 if a == nil || a.size == 0
	s = [0]
	res = 0
	for i in 1..a.size-1 do
		while !s.empty? && a[i] > a[s[-1]] do
			top = s.pop
			if !s.empty?
				distance = i - s[-1] - 1
				boundary_height = [a[s[-1]],a[i]].min - a[top]
				water = distance * boundary_height
				res = res + water
			end
		end
		s.push(i)
	end
	return res
end

puts trap([0,1,0,2,1,0,1,3,2,1,2,1])
