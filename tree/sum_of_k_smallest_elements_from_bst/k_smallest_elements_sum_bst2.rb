class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

def get_sum(node,k)
	@count = 0
	@sum = 0
	sum_util(node,k)
	@sum
end

private

def sum_util(node,k)
	if node == nil
		return 0
	end
	sum_util(node.left,k)
	@count = @count + 1
	if @count <= k
		@sum = @sum+node.val
	end
	sum_util(node.right,k)
end	

root = Node.new(4)
root.left = Node.new(2)
root.right = Node.new(5)
root.right.right = Node.new(6)
root.left.left = Node.new(1)
root.left.right = Node.new(3)
puts get_sum(root,5)

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
puts get_sum(root,3)