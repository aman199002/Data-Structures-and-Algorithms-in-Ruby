class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end	

def size(node)
	if node==nil
		return 0
	end
	lsize = size(node.left)
	rsize = size(node.right)
	return(lsize+rsize+1)
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
print size(root)