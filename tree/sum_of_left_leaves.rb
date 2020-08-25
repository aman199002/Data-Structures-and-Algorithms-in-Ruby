class Node
	attr_accessor :left,:right,:val

	def initialize(val)
		@val = val		
	end

end	

def sum_of_left_leaves(node)
	@sum = 0
	sum_of_left_leaves_util(node)	
	return @sum
end

private

def sum_of_left_leaves_util(node)
    if node == nil
    	return
    end
    left = sum_of_left_leaves_util(node.left)
    if left != nil && (left.left == nil && left.right == nil)
    	@sum = @sum + left.val
    end
    right = sum_of_left_leaves_util(node.right)
    return node
end

root = Node.new(3)
root.left = Node.new(9)
root.right = Node.new(20)
root.right.left = Node.new(15)
root.right.right = Node.new(7)
root.right.right.left = Node.new(6)

puts sum_of_left_leaves(root)
