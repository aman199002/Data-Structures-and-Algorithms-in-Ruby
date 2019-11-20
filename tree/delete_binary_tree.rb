class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end	
end	

def delete_node(node)
	if node == nil
		return
	end
	delete_node(node.left)
	delete_node(node.right)
	puts "Deleting node #{node.val}"
	node = nil	
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root = delete_node(root)