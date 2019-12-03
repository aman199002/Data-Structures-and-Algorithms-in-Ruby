class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val
	end

end

def print_common(root1,root2)
	s1 = Array.new # Creating new stack s1 in form of array
	s2 = Array.new # Creating new stack s2 in form of array
	inorder(root1,s1) # Pusing inorder traversal of tree1 in s1
	inorder(root2,s2) # Pusing inorder traversal of tree2 in s2
	stack = Array.new # Creating new stack s1 in form of array to store common nodes
	while !s1.empty? && !s2.empty? do
		if s1[-1] == s2[-1]  # If peek of s1 and s2 are equal, then node is common. Push it to stack and pop from s1 and s2
			stack.push(s1[-1])
			s1.pop
			s2.pop
		elsif s1[-1] > s2[-1] # If peek of s1 is greater than peek of s2, then there is chance that next element from s1 can be common, hence pop from s1
			s1.pop
		else # Else peek of s2 is greater than peek of s1, then there is chance that next element from s2 can be common, hence pop from s2
			s2.pop		
		end
	end
	# All elements are in stack now. Print by popping each element.
	while !stack.empty? do
		puts stack.pop
	end	
end

# Push each element to given stack during inorder traversal
def inorder(node,stack)
	if node == nil
		return
	end	
	inorder(node.left,stack)
	stack.push(node.val)
	inorder(node.right,stack)
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