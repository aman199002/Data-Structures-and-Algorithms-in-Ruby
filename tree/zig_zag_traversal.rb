class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end

end

# Print zig zag traversal of tree
def zig_zag(node)
	current_stack = [] # Stack to store elements of current level
	next_stack = [] # Stack to store elements of next level
	left_or_right = 1 # Flag to maintain direction
	current_stack.push(node)
	# Traverse till current stack is not empty
	while !current_stack.empty? do
		popped_item = current_stack.pop
		print popped_item.val
		if left_or_right # Based on direction boolean insert item in stack to attain zigzag order
			if popped_item.left
				next_stack.push(popped_item.left)
			end	
			if popped_item.right
				next_stack.push(popped_item.right)
			end
		else						
			if popped_item.right
				next_stack.push(popped_item.right)
			end	
			if popped_item.left
				next_stack.push(popped_item.left)
			end	
		end
		# After one level has been traversed, swap current stack with next stack and reverse direction boolean 
		if current_stack.empty?
			left_or_right = !left_or_right
			current_stack = next_stack
			next_stack = []
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
root.left.left.left = Node.new(8)
root.left.left.right = Node.new(9)
root.left.right.left = Node.new(10)
zig_zag(root)