class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end


def mirror_image(node)
	if node == nil
		return
	end
	left = mirror_image(node.left)
	right = mirror_image(node.right)
	node.left = right
	node.right = left
	return node
end

def level_order(node)
	q = []
	q.unshift(node)
	while !q.empty? do
		popped_item = q.pop
		print popped_item.val
		if popped_item.left
			q.unshift(popped_item.left)
		end
		if popped_item.right
			q.unshift(popped_item.right)
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
puts 'Printing level order of actual tree'
level_order(root)
mirror_image(root)
puts 'Printing level order of mirror tree'
level_order(root)