# Maximum Difference Between Node and Ancestor

# Given the root of a binary tree, find the maximum value V for which there exists different nodes A and B where V = |A.val - B.val| and A is an ancestor of B.
# (A node A is an ancestor of B if either: any child of A is equal to B, or any child of A is an ancestor of B.) 

# Example:

#		 8
#	  /	    \
#    3       10
#   / \        \
#  1   6        14
#     / \       /
#    4   7    13 
#

# Input: [8,3,10,1,6,null,14,null,null,4,7,13]
# Output: 7
# Explanation: 
# We have various ancestor-node differences, some of which are given below :
# |8 - 3| = 5
# |3 - 7| = 4
# |8 - 1| = 7
# |10 - 13| = 3
# Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end	

# Time Complexity = O(n)
# Space Complexity = O(1)
def max_ancestor_diff(node)
	return 0 if node == nil
	max_diff_util(node,node.val,node.val)
end

private

def max_diff_util(node,curr_min,curr_max)
	if node == nil
		return(curr_max - curr_min)
	end	
	curr_min = [curr_min,node.val].min
	curr_max = [curr_max,node.val].max
	return([max_diff_util(node.left,curr_min,curr_max),max_diff_util(node.right,curr_min,curr_max)].max)
end

node = Node.new(8)
node.left = Node.new(3)
node.left.left = Node.new(1)
node.left.right = Node.new(6)
node.right = Node.new(10)
node.right.right = Node.new(14)
node.right.right.left = Node.new(13)
puts max_ancestor_diff(node)

node = Node.new(2)
node.right = Node.new(0)
node.right.left = Node.new(1)
puts max_ancestor_diff(node)

node = Node.new(2)
node.right = Node.new(0)
node.right.right = Node.new(4)
node.right.right.right = Node.new(3)
node.right.right.right.right = Node.new(1)
puts max_ancestor_diff(node)

