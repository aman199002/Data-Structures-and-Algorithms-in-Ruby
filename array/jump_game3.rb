# Jump Game III

# Given an array of non-negative integers arr, you are initially positioned at start index of the array. When you are at index i, you can jump to i + arr[i] or i - arr[i], check if you can reach to any index with value 0.
# Notice that you can not jump outside of the array at any time. 

# Example:

# Input: arr = [4,2,3,0,3,1,2], start = 5
# Output: true
# Explanation: 
# All possible ways to reach at index 3 with value 0 are: 
# index 5 -> index 4 -> index 1 -> index 3 
# index 5 -> index 6 -> index 4 -> index 1 -> index 3 
# Example 2:

# Input: arr = [4,2,3,0,3,1,2], start = 0
# Output: true 
# Explanation: 
# One possible way to reach at index 3 with value 0 is: 
# index 0 -> index 4 -> index 1 -> index 3
# Example 3:

# Input: arr = [3,0,2,1,2], start = 2
# Output: false
# Explanation: There is no way to reach at index 1 with value 0.

# @param {Integer[]} arr
# @param {Integer} start
# @return {Boolean}
def can_reach(a, start)
    # arr = [4,2,3,0,3,1,2], start = 5
    return false if a == nil || a.size == 0
    visited = Array.new(a.size){false}
    q = [start]
    visited[start] = true
    while !q.empty? do
        popped_item = q.pop
        if a[popped_item] == 0
            return true
        end    
        right = popped_item + a[popped_item]
        if right < a.size && !visited[right]
            q.unshift(right)
            visited[right] = true
        end    
        left = popped_item - a[popped_item]
        if left >= 0 && !visited[left]
            q.unshift(left)
            visited[left] = true
        end    
    end    
    return false
end

puts can_reach([4,2,3,0,3,1,2],5)
puts can_reach([4,2,3,0,3,1,2],0)
puts can_reach([3,0,2,1,2],2)
