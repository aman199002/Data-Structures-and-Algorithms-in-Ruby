class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end

end

def find_sum_arr(node,k)
	k =[k]
	count = [0]
	find_sum_rec_arr(node,k,count)
end	

def find_sum_rec_arr(node,k,count)
	if node == nil
		return 0
	end
	if count[0] > k[0]
		return 0
	end
	res = find_sum_rec_arr(node.left,k,count)
	if count[0] >= k[0]
		return res
	end	
	res = res + node.val
	count[0] = count[0] + 1
	if count[0] >= k[0]
		return res
	end
	return(res + find_sum_rec_arr(node.right,k,count))
end

def inorder(node)
	inorder(node.left)
end	

root = Node.new(8)
root.left = Node.new(3)
root.right = Node.new(10)
root.left.left = Node.new(1)
root.left.right = Node.new(6)
root.left.right.left = Node.new(4)
root.left.right.right = Node.new(7)
root.right.right = Node.new(14)
root.right.right.left = Node.new(13)
print find_sum_arr(root,4)