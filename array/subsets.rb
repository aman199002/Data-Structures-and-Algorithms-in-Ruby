# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(a)
    return [[]] if a ==nil || a.size == 0
    res = [[]]  # res variable to store list of all subsets.
    # Traverse the given array.
    for i in 0..a.size-1 do
    	dup = res   # Assign res to another variable dup.
    	# Add this number to each subset of res subsets array and append result in same.
    	for j in 0..dup.size-1 do
    		res << [a[i]] + res[j]
    	end
    end
    return res  # Return res
end

print subsets([1,2,3,4,5])
