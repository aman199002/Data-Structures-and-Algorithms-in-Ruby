# Maximum Width of Binary Tree

# Given a binary tree, write a function to get the maximum width of the given tree. The width of a tree is the maximum width among all levels. The binary tree has the same structure as a full binary tree, but some nodes are null.
# The width of one level is defined as the length between the end-nodes (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

# Example 1:

# Input: 

#            1
#          /   \
#         3     2
#        / \     \  
#       5   3     9 

# Output: 4
# Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end	

def width_of_binary_tree(node)
	@left_most_positions = {}   # Initialize a hash to store left most element index at each level
	@max_width = 0  # max_width variable to store maximum width
	get_width(node,1,1)
	return @max_width  # Return max width
end

private

def get_width(node,curr_level,position)
	if node == nil
		return
	end
	# Set left most index value if its not nil.
	# As we are traversing left node first, so for each level first element encountered will always be left most.
	if !@left_most_positions[curr_level]
		@left_most_positions[curr_level] = position
	end
	# Find width every time a node appear by subtracting it from left most index for current level
	width = position - @left_most_positions[curr_level] + 1
	@max_width = [@max_width,width].max  # Update max width if its less than current width
	get_width(node.left,curr_level+1,2*position)  # Call same method recursively for left node with for next level
	get_width(node.right,curr_level+1,2*position+1)  # Call same method recursively for right node with for next level
end

node = Node.new(1)
node.left = Node.new(3)
node.right = Node.new(2)
node.left.left = Node.new(5)
node.left.left.left = Node.new(6)
node.right.right = Node.new(9)
node.right.right.right = Node.new(7)
puts width_of_binary_tree(node)
