class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def level_max_sum(node)
	h = height(node)
	max_sum = node.val
	for i in 1..h do
		@sum = 0
		print_level(node,i)
		max_sum = [max_sum,@sum].max		
	end	
	puts "max_sum = #{max_sum}"
	return max_sum
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

def print_level(node,level)	
	if node == nil
		return
	end	
	if level == 1
		@sum = @sum + node.val
		return
	end
	print_level(node.left,level-1)
	print_level(node.right,level-1)
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
level_max_sum(root)