class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end
		
end

def level_order(node)
	q = [] # Taking new queue in form of array
	q.push(node)
	while !q.empty? do
		popped_item = q.pop
		if popped_item.left
			q.unshift(popped_item.left)
		end
		if popped_item.right
			q.unshift(popped_item.right)
		end
		print popped_item.val
		print ' '
	end
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
level_order(root)