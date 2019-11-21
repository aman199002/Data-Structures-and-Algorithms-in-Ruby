class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end


def level_max_sum(node)
	q = []
	q.unshift(node)
	result = node.val
	while !q.empty? do
		sum = 0
		size = q.size
		while size != 0 do
			popped_item = q.pop
			# print popped_item.val
			if popped_item.left
				q.unshift(popped_item.left) 
				sum = sum + popped_item.left.val
			end	
			if popped_item.right
				q.unshift(popped_item.right) 
				sum = sum + popped_item.right.val
			end	
			size = size-1
		end	
		result = [result,sum].max
	end
	return result
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
puts level_max_sum(root)