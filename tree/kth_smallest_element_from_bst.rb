class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

# Find kth smallest element via inorder traversal using stack
# by keeping track of each node traversed
# Time Complexity will O(h+k)
# Space Complexity will O(h+k)
def find_kth_smallest(node,k)
	stack = [] # Create a stack in form of array
	# Traverse till node is not null or stack is not empty
	while node != nil || !stack.empty? do
		while node != nil do # Traverse till left node is not null
			stack.push(node)
			node = node.left
		end		
		popped_item = stack.pop # Pop from stack when there is no left element
		k = k - 1  # Reduce k as this node has been traversed and popped from stack
		if k == 0  # Print node if k is equal to 0 and break the loop.
			print popped_item.val
			print ' '
			break
		end	
		node = popped_item.right  # Set node equal to right of popped_item and repeat.
	end
end

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
print find_kth_smallest(root,11)