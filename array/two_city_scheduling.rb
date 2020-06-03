# Two City Scheduling
# There are 2N people a company is planning to interview. The cost of flying the i-th person to city A is costs[i][0], and the cost of flying the i-th person to city B is costs[i][1].
# Return the minimum cost to fly every person to a city such that exactly N people arrive in each city.

# Example 1:

# Input: [[10,20],[30,200],[400,50],[30,20]]
# Output: 110
# Explanation: 
# The first person goes to city A for a cost of 10.
# The second person goes to city A for a cost of 30.
# The third person goes to city B for a cost of 50.
# The fourth person goes to city B for a cost of 20.

# The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.

# Time Complexity = O(nlogn)
# Space Complexity = O(1)
def two_city_sched_cost(costs)
	return 0 if costs == nil || costs.size == 0  # Return 0 if costs array is nil or empty.
	# Sort array by difference in each subarray in descending order.
	costs = costs.sort_by{|cost| cost[1] - cost[0]}.reverse
	mid = costs.size/2  # Get mid.
	sum = 0
	# Traverse costs array.
	# For first half, get first element of every subarray and add to sum.
	# For second half, get second element of every subarray and add to sum.
	for i in 0..costs.size-1 do
		if i < mid
			sum = sum + costs[i][0]
		else
			sum = sum + costs[i][1]
		end	
	end
	return(sum)  # Return sum

end

puts two_city_sched_cost([[10,20],[30,200],[400,50],[30,20]])
puts two_city_sched_cost([[945,563],[598,753],[558,341],[372,54],[39,522],[249,459],[536,264],[491,125],[367,118],[34,665],[472,410],[109,995],[147,436],[814,112],[45,545],[561,308],[491,504],[113,548],[626,104],[556,206],[538,592],[250,460],[718,134],[809,221],[893,641],[404,964],[980,751],[111,935]])
