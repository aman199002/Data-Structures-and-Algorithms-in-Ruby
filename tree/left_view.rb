class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end	

def left_view(node)
	q = []
	q.unshift(node)
	while !q.empty? do
		size = q.size
		i = 0
		while size != 0 do
			popped_item = q.pop
			if i == 0
				print popped_item.val
			end	
			if popped_item.left
				q.unshift(popped_item.left)
			end	
			if popped_item.right
				q.unshift(popped_item.right)
			end			
			size = size-1
			i = i+1
		end	
	end
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
root.right.right.right = Node.new(8)
left_view(root)