# Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree
# Given a binary tree where each path going from the root to any leaf form a valid sequence, check if a given string is a valid sequence in such binary tree. 
# We get the given string from the concatenation of an array of integers arr and the concatenation of all values of the nodes along a path results in a sequence in the given binary tree.

# Example:

#						0
#			1							0	
#	0				1				0
#		1		0		0

# Input: root = [0,1,0,0,1,0,null,null,1,0,0], arr = [0,1,1,0]
# Output: true
# Explanation: 
# The path 0 -> 1 -> 1 -> 0 is a valid sequence.
# Other valid sequences are: 
# 0 -> 1 -> 0 -> 1
# 0 -> 0 -> 0

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	

end	

# Time Complexity = O(n)
# Space Complexity = O(log n)
def valid_sequence(node,a)
	@arr = []  # Initialize empty array
	@valid = false  # Boolean flag
	valid_sequence_util(node,a)
end	

private

# Utility function
def valid_sequence_util(node,a)
	# Return if node equals nil or given path has been matched using boolean flag.
	if node == nil || @valid == true
		return
	end
	@arr << node.val  # Insert each node value to path array while traversing.	
	# Traverse each child node recursively first left and then right.
	left = valid_sequence_util(node.left,a)
	right = valid_sequence_util(node.right,a)	
	# If node is a leaf node, compare if @arr is equal to given array.
	# If yes, then update boolean flag to true
	if node.left == nil && node.right == nil && @arr == a
		@valid = true
	end
	# In tail recursion while returning from leaf node, pop path array @arr so that last node i.e leaf node will be removed.
	@arr.pop
	return @valid  # Return boolean flag
end

node = Node.new(0)
node.left = Node.new(1)
node.right = Node.new(0)
node.left.left = Node.new(0)
node.left.right = Node.new(1)
node.left.left.right = Node.new(1)
node.left.right.left = Node.new(0)
node.left.right.right = Node.new(0)
node.right.left = Node.new(0)

puts valid_sequence(node,[0,1,0,1])

