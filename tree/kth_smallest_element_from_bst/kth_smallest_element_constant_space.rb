class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

def find_kth_smallest(node,k)
	nums = [0,0]
	val = kth_smallest_element_util(node,nums,k)
	nums[1]
end

private

def kth_smallest_element_util(node,nums,k)
	if node == nil
		return
	end	
	kth_smallest_element_util(node.left,nums,k)
	nums[0] = nums[0] + 1
	if nums[0] == k
		nums[1] = node.val
	end
	kth_smallest_element_util(node.right,nums,k)
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
print find_kth_smallest(root,3)