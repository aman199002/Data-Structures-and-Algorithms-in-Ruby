class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

# Store all elements in array using inorder traversal
# As inorder of bst is already sorted, find median from array
def find_median(node)
	arr = []
	inorder(node,arr)
	size = arr.size	
	if size%2 == 0
		(arr[size/2-1] + arr[size/2])/2.0
	else
		print arr
		arr[size/2]
	end	
end	

def inorder(node,arr)
	if node == nil
		return
	end	
	inorder(node.left,arr)
	arr << node.val
	inorder(node.right,arr)
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
root.right.right.right.right = Node.new(17)
print find_median(root)