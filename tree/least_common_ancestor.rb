class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end


def lca(node,n1,n2)
	if node == nil
		return
	end
	# If either n1 or n2 matches with node value, return node.
	if node.val == n1 || node.val == n2
		return node
	end
	l_lca = lca(node.left,n1,n2)
	r_lca = lca(node.right,n1,n2)
	# If both of the above calls return non null, it means one node is present in left subtree and other in right, so this node is LCA
	if l_lca != nil && r_lca != nil
		return node
	end
	# Otherwise check if left subtree or right subtree is LCA
	if l_lca != nil
		return l_lca
	else
		return r_lca
	end	
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
result_node = lca(root,6,7)
puts result_node.val