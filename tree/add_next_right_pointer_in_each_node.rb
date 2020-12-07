# Populating Next Right Pointers in Each Node II

# Given a binary tree

# struct Node {
#   int val;
#   Node *left;
#   Node *right;
#   Node *next;
# }

# Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
# Initially, all next pointers are set to NULL.

# Example
# Input: root = [1,2,3,4,5,null,7]
# Output: [1,#,2,3,#,4,5,7,#]

#        1
#     /     \
#    2       3
#   / \       \
#  4   5       7

#        1 -> NULL
#     /     \
#    2   ->  3  -> NULL
#   / \       \
#  4-> 5  ->   7  -> NULL

# Follow up:

# You may only use constant extra space.
# Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.


# Definition for a Node.
class Node
    attr_accessor :val, :left, :right, :next
    def initialize(val)
        @val = val
        @left, @right, @next = nil, nil, nil
    end
end

class QueueNode
    attr_accessor :node,:level
    
    def initialize(node,level)
        @node = node
        @level = level
    end    
end    

# @param {Node} root
# @return {Node}
def connect(node)
    return if node == nil
    queue_node = QueueNode.new(node,1)
    q = [queue_node]
    curr = queue_node
    h1 = {}
    while !q.empty? do
        popped = q.pop        
        if h1[popped.level]
            h1[popped.level].next = popped.node
            h1[popped.level] = popped.node
        else
            h1 = {popped.level => popped.node}
        end
        if popped.node.left
            q.unshift(QueueNode.new(popped.node.left,popped.level+1))
        end    
        if popped.node.right
            q.unshift(QueueNode.new(popped.node.right,popped.level+1))
        end    
    end        
    return node
end

node = Node.new(1)
node.left = Node.new(2)
node.right = Node.new(3)
node.left.left = Node.new(4)
node.left.right = Node.new(5)
node.right.right = Node.new(7)

puts connect(node)

