# All Nodes Distance K in Binary Tree
# We are given a binary tree (with root node root), a target node, and an integer value K.
# Return a list of the values of all nodes that have a distance K from the target node.  The answer can be returned in any order.

# Example:

# Input:
#         1 
#      /     \
#     2       3
#    / \     / \
#   4   5   6   7

# target = 2, k = 1
# Output: [4,5,1]

# Explanation: 
# The nodes that are a distance 2 from the target node (with value 2) have values 4, 5, and 1.

# Definition for a binary tree node.
class Node
    attr_accessor :val, :left, :right
    
    def initialize(val)
        @val = val
    end
end

# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}
def distance_k(root, target, k)
    result = []
    @parents = {}  # Initialize hash to store parent for all nodes.
    set_parents(root)  # Call set_parent method with root node.
    visited = {}  # Initialize hash to store visited flag for each node.
    # Initialize queue to store node and current distance of node from target node.
    q = [[target,0]]  # Insert target node and diatnce as 0 in first element.
    visited[target] = true
    # BFS/Level order traversal
    # Traverse till is queue is not empty
    while !q.empty? do
    	popped_node,dist = q.pop  # Pop last item from queue.
    	result << popped_node.val if dist == k  # Append in result if distance is equal to k. 
    	# Insert left node to queue if present and not visited by incrementing distance.
    	if popped_node.left && !visited[popped_node.left]
    		q.unshift([popped_node.left,dist+1])
            visited[popped_node.left] = true
    	end	
    	# Insert right node to queue if present and not visited by incrementing distance.
    	if popped_node.right && !visited[popped_node.right]
    		q.unshift([popped_node.right,dist+1])
            visited[popped_node.right] = true
    	end	
    	# Insert parent node to queue if present and not visited by incrementing distance.
    	if @parents[popped_node] && !visited[@parents[popped_node]]
    		q.unshift([@parents[popped_node],dist+1])
            visited[@parents[popped_node]] = true
    	end	
    end	
    return result  # Return result
end

private

# Set parent node in parents hash for all nodes by preorder traversal.
def set_parents(node)
	if node == nil
		return
	end
	if node.left
		@parents[node.left] = node
	end	
	if node.right
		@parents[node.right] = node
	end
	set_parents(node.left)
	set_parents(node.right)
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)
puts distance_k(root,root.left,1)

