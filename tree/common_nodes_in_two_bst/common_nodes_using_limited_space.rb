class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end

end

def print_common(node1,node2)
	stack = Array.new # Create stack in form of array 
	s1 = Array.new # Create stack s1 in form of array 
	s2 = Array.new # Create stack s2 in form of array
	while true do
		# Push all left nodes of given node1 to stack s1
		if node1 != nil
			s1.push(node1)
			node1 = node1.left
		# Push all left nodes of given node2 to stack s2
		elsif node2 != nil
			s2.push(node2)
			node2 = node2.left
		elsif !s1.empty? && !s2.empty?
			node1 = s1[-1]
			node2 = s2[-1]
			# If peek of s1 and s2 are equal then print and assign right element of both to node1 & node2.
			# Elsif peek of s1 is smaller, then next successor can be common so peek from s1 and assign node1.righjt to node1
			# Elsif peek of s2 is smaller, then next successor can be common so peek from s2 and assign node2.righjt to node2
			# Later on push this node in stack and compare again.
			# This way we are comparing left, root, right of each subtree in limited height.
			if node1.val == node2.val
				print node1.val
				print ' '
				s1.pop
				s2.pop
				node1 = node1.right
				node2 = node2.right
			elsif node1.val < node2.val
				s1.pop
				node1 = node1.right
				puts "node1 = #{node1&.val}"
				node2 = nil
			elsif node1.val > node2.val
				s2.pop
				node2 = node2.right
				node1 = nil
			end
		else
			break # Break when any of the stack gets empty.
		end
	end
end

# Push each element to given stack during inorder traversal
def inorder(node)
	if node == nil
		return
	end	
	inorder(node.left)
	print node.val
	print ' '
	inorder(node.right)
end	

root1 = Node.new(10)
root1.left = Node.new(6)
root1.right = Node.new(19)
root1.left.left = Node.new(5)
root1.left.right = Node.new(7)
root1.right.left = Node.new(11)
root1.right.right = Node.new(20)
root2 = Node.new(12)
root2.left = Node.new(10)
root2.right = Node.new(20)
root2.left.left = Node.new(8)
root2.left.right = Node.new(11)
root2.right.left = Node.new(18)
root2.right.right = Node.new(22)
print_common(root1,root2)