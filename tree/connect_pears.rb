class Node
	# Define attributes for each node left,right,next_right (for connecting to pear right element)
	attr_accessor :left,:right,:next_right,:val

	def initialize(val)
		@val = val		
	end

end

def connect_pears(node)
	if node == nil
		return
	end
	# If left of node is not null, then assign its next_right to right of node
	if node.left
		node.left.next_right = node.right		
	end
	# If right of node is not null and node has next right element, then assign its right to left of next right element of node 
	# otherwise assign next right to nil
	if node.right
		node.right.next_right = node.next_right ? node.next_right.left : nil		
	end
	puts "#{node.val} => #{node.next_right ? node.next_right.val : nil}"
	connect_pears(node.left) # Call this function recursively for left of each node
	connect_pears(node.right) # Call this function recursively for right of each node
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
connect_pears(root)