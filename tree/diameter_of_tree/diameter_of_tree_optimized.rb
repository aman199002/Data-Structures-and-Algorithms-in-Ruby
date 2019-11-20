#NNote: Complexity will O(n2) as each will be traversed in height function and diameter function

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end	
end

def diameter(node)
	@ans = 0
	height(node)
	return @ans
end	

# Modify height function and store answer while traversing each node
def height(node)
	if node == nil
		return 0
	end
	lheight = height(node.left)
	rheight = height(node.right)
	@ans = [@ans,(lheight+rheight+1)].max
	if lheight > rheight
		return lheight+1
	else
		return rheight+1
	end
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
print diameter(root)