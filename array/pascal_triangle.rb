# Pascal's Triangle

# Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
# In Pascal's triangle, each number is the sum of the two numbers directly above it.

# Example:

# Input: 5
# Output:
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    res = []
    for i in 1..num_rows do
        # Initialize array for each number in sequence and insert 1 as first and last element.
        arr = []
        arr[0] = 1
        arr[i-1] = 1
        # If number is 1 or 2, insert arr to res and skip to next call.
        if i == 1 || i == 2
            res << arr
            next 
        end
        # For each index in arr, add current and previous index numbers from previous step and store in arr.
        for j in 1..i-2 do
            arr[j] = res[i-2][j-1] + res[i-2][j]
        end
        res << arr  # Insert arr to res.
    end
    return res
end

print generate(8)
