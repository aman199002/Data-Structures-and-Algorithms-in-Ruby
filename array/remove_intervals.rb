# Remove Interval

# Given a sorted list of disjoint intervals, each interval intervals[i] = [a, b] represents the set of real numbers x such that a <= x < b.
# We remove the intersections between any interval in intervals and the interval toBeRemoved.
# Return a sorted list of intervals after all such removals.

# Example:

# Input: intervals = [[0,2],[3,4],[5,7]], toBeRemoved = [1,6]
# Output: [[0,1],[6,7]]

# Input: intervals = [[0,5]], toBeRemoved = [2,3]
# Output: [[0,2],[3,5]]

# Input: intervals = [[-5,-4],[-3,-2],[1,2],[3,5],[8,9]], toBeRemoved = [-1,4]
# Output: [[-5,-4],[-3,-2],[4,5],[8,9]]
 
# @param {Integer[][]} intervals
# @param {Integer[]} to_be_removed
# @return {Integer[][]}
def remove_interval(intervals, to_be_removed)
    res = []    
    to_remove_start = to_be_removed[0]
    to_remove_end = to_be_removed[1]
    for i in 0..intervals.size-1 do
        set = intervals[i]
        if set[1] <= to_remove_start || set[0] >= to_remove_end
            res << [set[0],set[1]]
        elsif set[0] < to_remove_start && set[1] < to_remove_end
            res << [set[0],to_remove_start]
        elsif set[0] < to_remove_start && set[1] >= to_remove_end
            res << [set[0],to_remove_start]
            res << [to_remove_end,set[1]]
        elsif set[0] >= to_remove_start && set[1] > to_remove_end
            res << [to_remove_end,set[1]]
        end    
    end    
    return res
end

print remove_interval([[0,2],[3,4],[5,7]],[1,6])
puts
print remove_interval([[0,5]],[2,3])
