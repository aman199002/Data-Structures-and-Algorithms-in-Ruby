# Check If It Is a Straight Line
# You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. 
# Check if these points make a straight line in the XY plane.

# Example
# Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
# Output: true

# Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
# Output: false

# @param {Integer[][]} coordinates
# @return {Boolean}
# First 2 values will decide the condition for reset of the elements.
# Find ratio for y/x by difference of first 2 values.
# Iterate rest of the array. Calculate ratio in same way and return false if its not same for other elements.
# If whole array is traversed means ratio is same. Hence its a straight line, so return true.
def check_straight_line(a	
	ratio = (a[1][1] - a[0][1])/(a[1][0] - a[0][0]).to_f
	for i in 2..a.size-1 do
		if (a[i][1] - a[i-1][1])/(a[i][0] - a[i-1][0]).to_f != ratio
			return false
		end	
	end
	return true
end

puts check_straight_line([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])
puts check_straight_line([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]])
puts check_straight_line([[-3,-2],[-1,-2],[2,-2],[-2,-2],[0,-2]])
puts check_straight_line([[0,1],[0,2],[0,3],[0,4]])	