# Find a Corresponding Node of a Binary Tree in a Clone of That Tree
# Given two binary trees original and cloned and given a reference to a node target in the original tree.
# The cloned tree is a copy of the original tree.
# Return a reference to the same node in the cloned tree.
# Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.

# Follow up: Solve the problem if repeated values on the tree are allowed.

# Example

#       7                       7
#    /     \                 /     \
#   4       3               4       3
#         /   \                   /   \
#        6     19                6     19 

# Output: 3


class Node
	attr_accessor :left, :right, :val

	def initialize(val)
		@val = val
	end	
end	

def get_target_copy(node,cloned,target)
	if node == nil || (node.left == nil && node.right == nil)
		return node
	end
	@path = []
	@target_found = false
	get_target_copy_path(node,target,nil)
	puts "@path = #{@path}"
	get_cloned_copy_util(cloned,@path)	
end

private

def get_cloned_copy_util(cloned_node,path)
	n = path.size
	i = 1
	while i < n do		
		if path[i] == 0
			cloned_node = cloned_node.left
		elsif path[i] == 1
			cloned_node = cloned_node.right
		end
		i = i+1
	end	
	return cloned_node
end	

def get_target_copy_path(node,target,direction)	
	if node == nil || @target_found
		return
	end	
	@path << direction	
	puts "node = #{node&.val}, target = #{target.val}, path = #{@path}"
	if node == target
		@target_found = true
	end	
	left = get_target_copy_path(node.left,target,0)
	right = get_target_copy_path(node.right,target,1)
	# puts "node = #{node.val}, target = #{target.val}, path = #{@path}"
	if (left == nil && right == nil) && !@target_found
		@path.pop
	end	
	return node
end

node = Node.new(7)
node.left = Node.new(4)
node.right = Node.new(3)
node.right.left = Node.new(6)
node.right.right = Node.new(19)

cloned_node = Node.new(7)
cloned_node.left = Node.new(4)
cloned_node.right = Node.new(3)
cloned_node.right.left = Node.new(6)
cloned_node.right.right = Node.new(19)

target = node.left

res_node = get_target_copy(node,cloned_node,target)
puts res_node&.val

