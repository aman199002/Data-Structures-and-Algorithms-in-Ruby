# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end
end

def is_symmetry(node)
	symmetry_util(node,node)
end

private

def symmetry_util(node1,node2)	
	if node1 == nil && node2 ==  nil
		return true
	end
	if (node1 != nil && node2 != nil && node1.val == node2.val)
		return(symmetry_util(node1.left,node2.right) && symmetry_util(node1.right,node2.left))
	end	
	false
end

node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(2)
node.left.left = Node.new(3)
node.left.right = Node.new(4)
node.right.left = Node.new(4)
node.right.right = Node.new(3)
puts is_symmetry(node)