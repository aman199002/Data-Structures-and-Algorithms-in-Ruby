# Merge Intervals

# Given a collection of intervals, merge all overlapping intervals.

# Example:

# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

# Input: intervals = [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considered overlapping.
# NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(a)
    return [] if a == nil || a.size == 0
    a = a.sort_by{|arr| arr[0]}  # First sort array by first element of each subarray.
    res = [a[0]]  # Push first subarray in resulting array.
    j = 0  # Keep a pointer for res array.
    for i in 0..a.size-1 do
        # Compare previous and next element using res array.
        # If second element in res subarray is greater than or equal first element in next subarray, it means elements are overlapping.
        # Calculate max by comparing second element in previous and current subarray.
        # Modify res by overriding current subarray.
        if res[j][1] >= a[i][0]
            min = res[j][0]
            max = [a[i][1],res[j][1]].max
            res[j] = [min,max]
        # If second element in res subarray is less than first element in next subarray, it means elements are non overlapping.
        # Push subarray in res and increment pointer for res.
        else
            res << a[i]
            j = j+1
        end
    end
    return res
end


print merge([[1,3],[2,6],[8,10],[15,18]])
puts
print merge([[1,10],[1,3],[1,6],[8,11],[15,18]])
puts
print merge([[1,10],[1,10],[5,6],[2,8],[15,18]])
