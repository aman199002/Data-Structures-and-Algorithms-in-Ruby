# Inorder Successor in BST II

# Given a node in a binary search tree, find the in-order successor of that node in the BST.
# If that node has no in-order successor, return null.
# The successor of a node is the node with the smallest key greater than node.val.
# You will have direct access to the node but not to the root of the tree. Each node will have a reference to its parent node. Below is the definition for Node:

# class Node {
#     public int val;
#     public Node left;
#     public Node right;
#     public Node parent;
# }
 
# Follow up:

# Could you solve it without looking up any of the node's values?

# Example1:

#   2
#  / \
# 1   3

# Input: tree = [2,1,3], node = 1
# Output: 2
# Explanation: 1's in-order successor node is 2. Note that both the node and the return value is of Node

# Example2:

#        5
#      /   \
#     3     6
#    / \
#   2   4
#  /
# 1  

# Input: tree = [5,3,6,2,4,null,null,1], node = 6
# Output: null
# Explanation: There is no in-order successor of the current node, so the answer is null.

# Input: tree = [5,3,6,2,4,null,null,1], node = 4
# Output: 3


# Definition for a Node.
class Node
    attr_accessor :val, :left, :right, :parent
    def initialize(val=0)
        @val = val
        @left, @right, parent = nil, nil, nil
    end
end

# @param {Node} root
# @return {Node}
def inorderSuccessor(node)
	if node == nil
        return nil
    end
    # If right is not equal to nil
    # Then go 1 step right and extreme left
    if node.right != nil
        node = node.right
        while node.left != nil do
            node = node.left
        end
        return node
    end
    # If right is equal to nil
    # Then go to the node that is left child of its parent, then return parent.
    if node.right == nil
        while node.parent != nil && node == node.parent.right do
            node = node.parent
        end
        return node.parent
    end
end

node = Node.new(5)
node.left = Node.new(3)
node.left.parent = node
node.right = Node.new(6)
node.right.parent = node
node.left.left = Node.new(2)
node.left.left.parent = node.left
node.left.left.left = Node.new(1)
node.left.left.left.parent = node.left.left
node.left.right = Node.new(4)
node.left.right.parent = node.left


res_node = inorderSuccessor(node.left.left.left)
puts res_node&.val

