# Find maximum number of nodes at a level of binary tree.

class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end
end

def max_length(node)
	return 0 if node == nil
	h = height(node)
	max = 0
	for i in 1..h do
		@counter = 0
		count = get_nodes_count(node,1,i)
		max = count if count > max
	end	
	max
end

private

def get_nodes_count(node,curr_level,level)
	if node == nil || curr_level > level
		return
	end
	if curr_level == level
		@counter = @counter+1
	end
	get_nodes_count(node.left,curr_level+1,level)
	get_nodes_count(node.right,curr_level+1,level)
	@counter
end	

def height(node)
	if node == nil
		return 0
	end
	lh = height(node.left)
	rh = height(node.right)
	if lh > rh
		return(lh+1)
	else
		return(rh+1)
	end	
end	

node = Node.new(1)	
node.left = Node.new(2)
node.right = Node.new(3)
node.left.left = Node.new(4)
node.right.left = Node.new(5)
node.right.right = Node.new(6)
node.left.left.left = Node.new(7)
node.right.right.right = Node.new(8)
puts max_length(node)