class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

# 1. If left equals nil then print
# 2. Else, go to right most of left element
# 3. Point its right to equal current node
# 4. Again go to right most of left and break the link and print current
# 5. Assign right of current to current
def inorder(node)
	current = node
	while current != nil
		if current.left == nil
			print current.val
			print ' '
			current = current.right
		else
			pre = current.left
			while pre.right != nil && pre.right != current do
				pre = pre.right
			end
			if pre.right == nil
				pre.right = current
				current = current.left
			else
				pre.right = nil
				print current.val
				print ' '
				current = current.right
			end
		end
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
print inorder(root)