# Minimum Depth of Binary Tree

# Given a binary tree, find its minimum depth.
# The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

# Note: A leaf is a node with no children.

# Example:

# Input: root = [3,9,20,null,null,15,7]
# Output: 2

# Input: root = [2,null,3,null,4,null,5,null,6]
# Output: 5

class Node
    
    attr_accessor :val, :left, :right
    
    def initialize(val)
        @val = val
    end
end

# @param {TreeNode} root
# @return {Integer}
# Time Complexity = O(n)
# Space Complexity = O(1)
def min_depth(node)
	return 0 if node == nil
	@min = Float::INFINITY
	min_depth_util(node,0)
	return @min
end

private

def min_depth_util(node,length)
	if node == nil
		return
	end	
	length = length+1
	left = min_depth_util(node.left,length)
	right = min_depth_util(node.right,length)
	if left == nil && right == nil
		@min = [@min,length].min
	end	
	length = length-1
end	

node = Node.new(3)
node.left = Node.new(1)
node.left.left = Node.new(10)
node.right = Node.new(5)
node.right.left = Node.new(4)
node.right.right = Node.new(6)

puts min_depth(node)
