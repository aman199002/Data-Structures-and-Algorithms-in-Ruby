class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end
		
end

def preorder(node)
	if node == nil
		return
	end	
	print node.val
	print ' '
	preorder(node.left)
	preorder(node.right)
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
preorder(root)