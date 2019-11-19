class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end	

def level_order(node)
	h = height(node)
	for i in 1..h do
		print_level_order(node,i)
	end		
end

private

def height(node)
	if node == nil
		return 0
	end
	lheight = height(node.left)
	rheight = height(node.right)
	if lheight > rheight
		return(lheight + 1)
	else
		return(rheight + 1)
	end	
end

def print_level_order(node,level)
	if node == nil
		return
	end	
	if level ==1
		print node.val
		print ' '
	end
	print_level_order(node.left,level-1)
	print_level_order(node.right,level-1)
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
level_order(root)