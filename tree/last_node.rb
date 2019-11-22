class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def deepest_node(node)
	h = height(node)
	node = get_deepest_node(node,h)
	puts node.val
end

private

def height(node)
	if node == nil
		return 0
	end
	lheight = height(node.left)
	rheight = height(node.right)
	return([lheight,rheight].max+1)
end

def get_deepest_node(node,height)
	if node == nil
		return
	end
	if height == 1
		return node
	end
	lnode = get_deepest_node(node.left,height-1)
	rnode = get_deepest_node(node.right,height-1)
	if rnode
		return rnode
	else
		return lnode	
	end
end	


root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
deepest_node(root)