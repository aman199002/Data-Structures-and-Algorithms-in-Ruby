class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end	
end

def insert(root,element)
	if root == nil
		return Node.new(element)
	end
	if element <= root.val
		root.left = insert(root.left,element)
	else
		root.right = insert(root.right,element)
	end
	return root
end

def inorder(node)
	if node == nil
		return
	end	
	inorder(node.left)
	print node.val
	print ' '
	inorder(node.right)
end	

root = Node.new(50)
insert(root, 30)
insert(root, 20)
insert(root, 40)
insert(root, 70)
insert(root, 60)
insert(root, 80)
inorder(root)