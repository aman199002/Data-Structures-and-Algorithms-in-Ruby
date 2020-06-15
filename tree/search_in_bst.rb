# Search in a Binary Search Tree
# Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.

# For example, 
# Given the tree:
#         4
#        / \
#       2   7
#      / \
#     1   3
# And the value to search: 2

# You should return this subtree:
#       2     
#      / \   
#     1   3

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end
end

# Time Compexity = O(n)
# Space Compexity = O(1)
def search_bst(node,val)
	@res = nil  # Initialize res variable with nil
	search_util(node,val)
	return(@res)
end	

private

def search_util(node,val)
	if node == nil
		return
	end
	# If node value equals val, store node in res.
	if node.val == val
		@res = node
		return
	end
	# If given val is less than node val, then search in left subtree, else right subtree.
	if val < node.val
		search_util(node.left,val)
	else
		search_util(node.right,val)
	end
end


node = Node.new(4)
node.left = Node.new(2)
node.left.left = Node.new(1)
node.left.right = Node.new(3)
node.right = Node.new(7)
res =  search_bst(node,2)
puts res&.val
# puts res.left.val
# puts res.right.val
