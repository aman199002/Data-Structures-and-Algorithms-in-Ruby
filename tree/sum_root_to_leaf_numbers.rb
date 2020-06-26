# Sum Root to Leaf Numbers
# Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
# An example is the root-to-leaf path 1->2->3 which represents the number 123.
# Find the total sum of all root-to-leaf numbers.
# Note: A leaf is a node with no children.

# Example:

# Input: [1,2,3]
#     1
#    / \
#   2   3
# Output: 25
# Explanation:
# The root-to-leaf path 1->2 represents the number 12.
# The root-to-leaf path 1->3 represents the number 13.
# Therefore, sum = 12 + 13 = 25.

# Input: [4,9,0,5,1]
#     4
#    / \
#   9   0
#  / \
# 5   1
# Output: 1026
# Explanation:
# The root-to-leaf path 4->9->5 represents the number 495.
# The root-to-leaf path 4->9->1 represents the number 491.
# The root-to-leaf path 4->0 represents the number 40.
# Therefore, sum = 495 + 491 + 40 = 1026.

# Time Complexity = O(n)
# Space Complexity = O(1)
class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end	
end

def sum_numbers(node)
	@sum = 0  # Initialize variable to store sum of all paths.
	@curr_path_sum = 0  # Initialize variable to store sum of current path.
    sum_numbers_util(node)
    return @sum
end

private

def sum_numbers_util(node)
	# Return if node equals nil.
	if node == nil
		return
	end
	# If left and right are nil, means its a leaf node.
	# First calculate current path sum.
	# Then add current path sum to total sum.
	# This leaf node is traversed, so remove leaf node significance from current path sum.
	if node.left == nil && node.right == nil
		@curr_path_sum = @curr_path_sum * 10 + node.val	
		@sum = @sum + @curr_path_sum
		@curr_path_sum = @curr_path_sum/10
		return
	end
	# For each node, add its value to current path sum.
	@curr_path_sum = @curr_path_sum * 10 + node.val
	# Recursively call this method for left and right nodes.
	sum_numbers_util(node.left)
	sum_numbers_util(node.right)
	# Remove node value significance from current path sum once node is traversed.
	@curr_path_sum = @curr_path_sum/10
end

node = Node.new(4)
node.left = Node.new(9)
node.right = Node.new(0)
node.left.left = Node.new(5)
node.left.right = Node.new(1)
puts sum_numbers(node)

node2 = Node.new(0)
node2.left = Node.new(1)
puts sum_numbers(node2)

