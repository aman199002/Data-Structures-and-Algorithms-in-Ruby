# Sum of Root To Leaf Binary Numbers

# Given a binary tree, each node has value 0 or 1.  Each root-to-leaf path represents a binary number starting with the most significant bit.  For example, if the path is 0 -> 1 -> 1 -> 0 -> 1, then this could represent 01101 in binary, which is 13.
# For all leaves in the tree, consider the numbers represented by the path from the root to that leaf.
# Return the sum of these numbers.

# Example:

#         1 
#      /     \
#     0       1
#    / \     / \
#   0   1   0   1
# Input: [1,0,1,0,1,0,1]
# Output: 22
# Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22


class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end
		
end

def sum_root_to_leaf(node)
	@num = 0
	@sum = 0
	sum_util(node)
end	

private

def sum_util(node)
	if node == nil
		return
	end	
	if node.left == nil && node.right == nil
		@num = @num*10 + node.val		
		@sum = @sum + (@num.to_s.to_i(2))  # Convert binary number to integer and add in sum.
		@num = @num/10
		return @sum
	end	
	@num = @num*10 + node.val
	sum_util(node.left)
	sum_util(node.right)
	@num = @num/10
	return @sum
end

root = Node.new(1)
root.left = Node.new(0)
root.right = Node.new(1)
root.left.left = Node.new(0)
root.left.right = Node.new(1)
root.right.left = Node.new(0)
root.right.right = Node.new(1)

puts sum_root_to_leaf(root)
