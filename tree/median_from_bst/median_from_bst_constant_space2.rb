class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

def get_median(node)
	length = get_length(node)
	@count = 0
	@median = 0
	median_util(node,length)
	@median
end

private

def median_util(node,length)
	if node == nil
		return 0
	end	
	median_util(node.left,length)
	@count = @count+1
	if length%2 != 0
		if @count == length/2 + 1
			@median = node.val
		end	
	else
		if @count == length/2 
			@median = node.val
		elsif @count == length/2 + 1
			@median = (@median + node.val)/ 2.0
		end	
	end	
	median_util(node.right,length)
end

def get_length(node)
	if node == nil
		return 0
	end
	get_length(node.left) + get_length(node.right) + 1
end

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.right.right = Node.new(6)
root.left.left = Node.new(1)
root.left.right = Node.new(3)
puts get_median(root)

root = Node.new(8)
root.left = Node.new(3)
root.right = Node.new(10)
root.left.left = Node.new(1)
root.left.right = Node.new(6)
root.left.right.left = Node.new(4)
root.left.right.right = Node.new(7)
root.right.left = Node.new(9)
root.right.right = Node.new(14)
root.right.right.left = Node.new(13)
root.right.right.right = Node.new(15)
root.right.right.right.right = Node.new(16)
puts get_median(root)