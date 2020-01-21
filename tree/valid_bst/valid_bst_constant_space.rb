class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

# Time complexity O(n)
# Space complexity O(1)
def is_valid_bst(node)
	min = -(2**32) # Considering as min integer
	max = (2**32)  # Considering as max positive integer
	valid_bst_util(node,min,max)
end

private

def valid_bst_util(node,min,max)
	if node == nil
		return true
	end
	if node.val < min || node.val > max
		return false
	end	
	valid_bst_util(node.left,min,node.val) && valid_bst_util(node.right,node.val,max)
end	

node = Node.new(3)
node.left = Node.new(1)
node.right = Node.new(5)
node.right.left = Node.new(4)
node.right.right = Node.new(6)
puts is_valid_bst(node)