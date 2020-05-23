# Interval List Intersections
# Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.
# Return the intersection of these two interval lists.
# (Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  
# The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.
# For example, the intersection of [1, 3] and [2, 4] is [2, 3].)

# Example
# Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
# Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]

# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
	res = []
	# Traverse for each pair in array a and compare with each pair in array b.
	for i in 0..a.size-1 do
		for j in 0..b.size-1 do
			val = compare(a[i],b[j])
			res << val if val != nil
		end	
	end    
	return res
end

private 

def compare(a1,a2)
	return nil if a2[0] > a1[1] || a1[0] > a2[1] # Return nil if number is out of range.
	res_sub = []  # Store result of subarray in res_sub.
	if a2[0] >= a1[0] && a2[0] <= a1[1]
		res_sub[0] = a2[0]
	elsif a1[0] >= a2[0] && a1[0] <= a2[1]
		res_sub[0] = a1[0]
	end	
	if a2[1] >= a1[0] && a2[1] <= a1[1]
		res_sub[1] = a2[1]
	elsif a1[1] >= a2[0] && a1[1] <= a2[1]	
		res_sub[1] = a1[1]
	end
	return res_sub
end	

a = [[0,2],[5,10],[13,23],[24,25]]
b = [[1,5],[8,12],[15,24],[25,26]]
print interval_intersection(a, b)