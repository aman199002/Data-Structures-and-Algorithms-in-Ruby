class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

# First get size of tree using morris inorder traversal
# Again find median using size and morris inorder traversal
# Time Complexity will O(1) and space complexity will be O(1)
def find_median(node)
	size = count_using_inorder(node)
	median_using_inorder(node,size)
end

# 1. If left equals nil then print
# 2. Else, go to right most of left element
# 3. Point its right to equal current node
# 4. Again go to right most of left and break the link and print current
# 5. Assign right of current to current
def count_using_inorder(node)
	count = 0
	current = node
	while current != nil
		if current.left == nil
			print current.val
			print ' '
			count = count + 1
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
				count = count + 1
				current = current.right
			end
		end
	end
	return count
end

# If size is odd and counter equals middle node then return it
# Elsif size is even and node equals middle node, then return (prev node value + current node value)/2
def median_using_inorder(node,size)
	count = 0
	current = node
	prev = nil
	while current != nil
		if current.left == nil
			count = count + 1
			if size%2 != 0 && count == (size+1)/2
				print "median = #{current.val}"
			elsif size%2==0 && count == (size/2)+1
				puts "current = #{current.val} prev = #{prev.val}"
				print "median = #{(current.val + prev.val)/2.0}"
			end	
			prev = current
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
				count = count + 1
				if size%2 != 0 && count == (size+1)/2
					print "median = #{current.val}"
				elsif size%2==0 && count == (size/2)+1
					print "median = #{(current.val + prev.val)/2.0}"
				end
				prev = current
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
root.right.right.right.right = Node.new(17)
find_median(root)