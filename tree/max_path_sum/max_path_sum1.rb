# Binary Tree Maximum Path Sum
# Given a non-empty binary tree, find the maximum path sum.
# For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

# Example
# Input: [-10,9,20,null,null,15,7]
#    -10
#    / \
#   9  20
#     /  \
#    15   7
# Output: 42

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end	

# Time Complexity = O(n)
# Space Complexity = O(1)
def max_path_sum(node)
	@result = -2147483648  # Minimum value
	return @result if node == nil
    max_path_sum_util(node)
	@result
end

private

def max_path_sum_util(node)
	if node == nil
    	return 0
    end
    left = [0,max_path_sum_util(node.left)].max  # Left path sum, remove negative elements by comparing with 0.
    right = [0,max_path_sum_util(node.right)].max  # Reft path sum, remove negative elements by comparing with 0.
    # Find sum by adding left,right,node. If any of left and right path sum is negative, its has already been considered as 0 in above call.
    sum = left + right + node.val
    # Compare sum with result. Update result if its less than sum.
    if sum > @result
    	@result = sum
    end
    # Return max straight path by comparing left and right.
    return [left,right].max + node.val
end	

node = Node.new(-10)
node.left = Node.new(9)
node.right = Node.new(20)
node.right.left = Node.new(15)
node.right.right = Node.new(7)
puts max_path_sum(node)

node = Node.new(1)
node.left = Node.new(-2)
node.right = Node.new(3)
puts max_path_sum(node)

node = Node.new(2)
node.left = Node.new(-1)
puts max_path_sum(node)
