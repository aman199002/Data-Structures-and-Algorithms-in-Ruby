# Sort Array By Parity
# Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.
# You may return any answer array that satisfies this condition.

# Example:

# Input: [3,1,2,4]
# Output: [2,4,3,1]
# The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 

# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
    return [] if a == nil || a.size == 0
    even_nums = []
    odd_nums = []
    for i in 0..a.size-1 do
        if a[i]%2 == 0
            even_nums << a[i]
        else    
            odd_nums << a[i]
        end    
    end
    return(even_nums + odd_nums)
end

print sort_array_by_parity([3,1,2,4])
