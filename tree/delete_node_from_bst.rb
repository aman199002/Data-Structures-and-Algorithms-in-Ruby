# Delete Node in a BST
# Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
# Basically, the deletion can be divided into two stages:

# Search for a node to remove.
# If the node is found, delete the node.
# Note: Time complexity should be O(height of tree).

# Example:

# root = [5,3,6,2,4,null,7]
# key = 3

#     5
#    / \
#   3   6
#  / \   \
# 2   4   7

# Given key to delete is 3. So we find the node with value 3 and delete it.

# One valid answer is [5,4,6,2,null,null,7], shown in the following BST.

#     5
#    / \
#   4   6
#  /     \
# 2       7

# Another valid answer is [5,2,6,null,4,null,7].

#     5
#    / \
#   2   6
#    \   \
#     4   7


class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end

end	

def delete_node(node,key)
	if node == nil
		return
	end	
	if key < node.val
		node.left = delete_node(node.left,key)
	elsif key > node.val
		node.right = delete_node(node.right,key)
	else
		if node.left == nil && node.right == nil
			node = nil
		elsif node.right
			node.val = successor(node)
			node.right = delete_node(node.right,node.val)
		else
			node.val = predecessor(node)
			node.left = delete_node(node.left,node.val)
		end
	end
	return node
end	

def display(node)
	q = [node]
	while !q.empty? do
		popped_item = q.pop
		print popped_item.val
		print ' '
		if popped_item.left
			q.unshift(popped_item.left)
		end
		if popped_item.right
			q.unshift(popped_item.right)
		end
	end	
end	

private

def successor(node)
	node = node.right
	while node.left != nil do
		node = node.left
	end	
	return node.val
end	

def predecessor(node)
	node = node.left
	while node.right != nil do
		node = node.right
	end	
	return node.val
end

node = Node.new(5)
node.left = Node.new(3)
node.right = Node.new(6)
node.left.left = Node.new(2)
node.left.right = Node.new(4)
node.right.right = Node.new(7)
display(node)
res_node =  delete_node(node,3)
puts
display(res_node)
