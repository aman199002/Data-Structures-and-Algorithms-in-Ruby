class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
		@left = nil
		@right = nil
	end

end	

# Find median at any given level from binary tree
def median(node,level)
	list = list_at_level(node,level,[]) #NOTE: Get all elements present at given level in list variable
	return list[list.size/2]
end

private

def list_at_level(node,level,list)
	if node == nil
		return
	end
	if level == 1  #If level is equal to 1, then add element to list and return
		list.push(node.val)
		return
	end	
	list_at_level(node.left,level-1,list)
	list_at_level(node.right,level-1,list)
	return list
end	

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
root.left.right.right = Node.new(8)
root.right.right.right = Node.new(9)
print median(root,3)