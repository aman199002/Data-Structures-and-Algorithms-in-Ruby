# Given two binary trees, write a function to check if they are the same or not.
# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

# Example 1:

# Input:     1         1
#           / \       / \
#          2   3     2   3

#         [1,2,3],   [1,2,3]
# Output: true

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	

end	


# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(node1,node2)
	# Return true if both nodes are equal to null.
    if node1 == nil && node2 == nil
        return true
    # If any one of the node is null Or both nodes are not equal, return false.
    elsif node1 == nil || node2 == nil || node1.val != node2.val
        return false
    end
    # Recursively call this function for left and right nodes and return.
    return is_same_tree(node1.left,node2.left) && is_same_tree(node1.right,node2.right)
end

node1 = Node.new(1)
node1.left = Node.new(2)
node1.right = Node.new(3)
node1.left.left = Node.new(4)
node1.left.right = Node.new(5)
node1.right.left = Node.new(6)
node1.right.right = Node.new(7)

node2 = Node.new(1)
node2.left = Node.new(2)
node2.right = Node.new(3)
node2.left.left = Node.new(4)
node2.left.right = Node.new(5)
node2.right.left = Node.new(6)
node2.right.right = Node.new(7)

puts is_same_tree(node1,node2)
