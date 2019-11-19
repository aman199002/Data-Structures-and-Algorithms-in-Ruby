class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end	

def inorder(node)
	if node == nil
		return
	end	
	inorder(node.left)
	print node.val
	print ' '
	inorder(node.right)
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
inorder(root)