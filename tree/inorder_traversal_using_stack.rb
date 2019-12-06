class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end
end

def inorder(node)
	stack = []
	while node != nil || !stack.empty? do
		while node != nil do
		  # puts node.val	
		  stack.push(node)
		  node = node.left
		end
		popped_item = stack.pop
		print popped_item.val
		print ' '
		node = popped_item.right
	end
end

def inorder_rec(node)
	if node == nil
		return
	end	
	inorder_rec(node.left)
	print node.val
	print ' '
	inorder_rec(node.right)
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.left.right = Node.new(8)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
inorder(root)