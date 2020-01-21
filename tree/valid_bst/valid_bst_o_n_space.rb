class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

# Time Complexity O(n)
# Space Complexity O(n)
def is_valid_bst(node)
	@a = []
	inorder(node)
	for i in 0..@a.size-2 do
		if @a[i] > @a[i+1]
			return false
		end
	end
	true
end

private

def inorder(node)
	if node == nil
		return
	end
	inorder(node.left)
	@a << node.val
	inorder(node.right)
end

node = Node.new(3)
node.left = Node.new(1)
node.right = Node.new(5)
node.right.left = Node.new(4)
node.right.right = Node.new(6)
puts is_valid_bst(node)