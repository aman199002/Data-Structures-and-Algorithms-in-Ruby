class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def height(node)
	if node == nil
		return -1 #NOTE: At some places height is considered as total number of levels then use 0, at some places it is minus one then use -1.
	end	
	lheight = height(node.left)
	rheight = height(node.right)
	if lheight > rheight
		return(lheight+1)
	else
		return(rheight+1)	
	end	
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
print height(root)