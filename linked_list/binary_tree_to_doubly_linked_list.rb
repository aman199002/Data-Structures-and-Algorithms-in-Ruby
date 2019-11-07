class ListNode
	attr_accessor :prev, :next, :val

	def initialize(val)
		@val = val
		@next = nil
		@prev = nil
	end	

end

class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end	

end

def binary_tree_to_dll(root)
	if root == nil
		return
	end
	queue = [] # Using array as queue
	queue.unshift(root)
	parent = nil
	child = nil
	while !queue.empty? do
		child = queue.pop
		if child.left
			queue.unshift(child.left)
		end
		if child.right
			queue.unshift(child.right)
		end
		child.right = queue[-1] # Get peek element from queue
		child.left = parent
		parent = child
	end
	display_list(root)
end

def diaplay_bst(root)
	queue = [] # Using array as queue
	queue.unshift(root)
	while !queue.empty? do
		temp_node = queue.pop
		print temp_node.val
		print ' '
		if temp_node.left != nil
			queue.unshift(temp_node.left)
		end
		if temp_node.right != nil
			queue.unshift(temp_node.right)
		end
	end
end

def display_list(node)
	while node != nil do
		print node.val
		print ' '
		node = node.right
	end
end

node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(3)
node.left.left = Node.new(4)
node.left.right = Node.new(5)
node.right.left = Node.new(6)
node.right.right = Node.new(7)
# diaplay_bst(node)
binary_tree_to_dll(node)
