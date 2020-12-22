# Find Nearest Right Node in Binary Tree

# Given the root of a binary tree and a node u in the tree, return the nearest node on the same level that is to the right of u, 
# or return null if u is the rightmost node in its level.

#           1 
#        /     \ 
#       2       3
#        \     / \
#         4   5   6

# Example:

# Input: root = [1,2,3,null,4,5,6], u = 4, Output: 5
# Explanation: The nearest node on the same level to the right of node 4 is node 5.

# Input: root = [1,2,3,null,4,5,6], u = 3, Output: nil
# Explanation: There are no nodes to the right of 3.

# Definition for a binary tree node.
class Node
    attr_accessor :val, :left, :right
    
    def initialize(val)
        @val = val
        @left = left
        @right = right
    end
end

class QueueNode
    attr_accessor :node,:level
    
    def initialize(node,level)
        @node = node
        @level = level
    end    
    
end

# @param {TreeNode} root
# @param {TreeNode} u
# @return {TreeNode}
def find_nearest_right_node(node, u)
    return nil if node == nil
    q = [QueueNode.new(node,1)]  # Insert root node and level in queue.
    target_level = -1  # Set target_level equal to some non existent value like -1 initially.
    while !q.empty? do
        popped_item = q.pop
        # If target_level has been found, then next node im same level will be the result node, so return that.
        if popped_item.level == target_level
            return popped_item.node
        end    
        # Set target_level when target node has been found.
        if popped_item.node == u
            target_level = popped_item.level
        end    
        if popped_item.node.left
            q.unshift(QueueNode.new(popped_item.node.left,popped_item.level+1))
        end    
        if popped_item.node.right
            q.unshift(QueueNode.new(popped_item.node.right,popped_item.level+1))
        end    
    end    
    # If no next node has been found in target_level, return nil.
    return nil
end

node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(3)
node.left.right = Node.new(4)
node.right.left = Node.new(5)
node.right.right = Node.new(6)

res_node = find_nearest_right_node(node,node.left.right)
puts res_node&.val
res_node = find_nearest_right_node(node,node.right)
puts res_node&.val



