 class Node
 	attr_accessor :left,:right,:val

 	def initialize(val)
 		@val = val
 		@left = nil
 		@right = nil
 	end

 end

 def postorder(node)
 	if node == nil
 		return
 	end
 	postorder(node.left)
 	postorder(node.right)
 	print node.val
 	print ' '
 end
 
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
postorder(root)	