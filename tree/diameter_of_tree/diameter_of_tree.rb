#NNote: Complexity will O(n2) as each will be traversed in height function and diameter function

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end	
end

def height(node)
	if node == nil
		return 0
	end	
	lheight = height(node.left)
	rheight = height(node.right)
	if lheight > rheight
		return lheight+1
	else
		return rheight+1
	end	
end

def diameter(node)
	if node==nil
		return 0
	end
	lheight = height(node.left)
	rheight = height(node.right)
	ldiameter = diameter(node.left)
	rdiameter = diameter(node.right)
	return [(lheight + rheight + 1),[ldiameter,rdiameter].max].max
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
print diameter(root)	

