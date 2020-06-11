# Sort Colors

# Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
# Note: You are not suppose to use the library's sort function for this problem.

# Example:

# Input: [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]

# Follow up:
# A rather straight forward solution is a two-pass algorithm using counting sort.
# First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
# Could you come up with a one-pass algorithm using only constant space?

# @param {Integer[]} nums
# Time Complexity = O(n)
# Space Complexity = O(1)
# To sort in place, we need to move all 0 to beginning and all 2 to end.
def sort_colors(a)
    start = 0  # Initialize start with 0
    last = a.size-1  # Initialize last with last element
    i = 0
    while i <= last && start < last do
        # If number equals 0, then swap with start position.
        # Increment index i and start counter as swapped element has already been traversed.
        if a[i] == 0
            swap(a,start,i)
            start = start+1
            i = i+1
        # If number equals 2, then swap it with last position.
        # Decrement last but dont increment index i as swapped element has not been traversed before.
        elsif a[i] == 2
            swap(a,last,i)
            last = last-1
        # If number equals 1, then do nothing and increment index i.
        else
            i = i+1
        end
        # puts "a = #{a}, start=#{start}"
    end
    return(a)
end

private

def swap(a,x,y)
    a[x],a[y] = a[y],a[x]
end

print sort_colors([2,0,2,1,1,0])
print sort_colors([1,1,1,0,1,1,0])


